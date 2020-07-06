
import UIKit

class GlobileActionSheetController: UIViewController {
	@IBOutlet weak var headerView: UIView!
	@IBOutlet weak var stackView: UIStackView!
	
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var headerTitle: UILabel!
	
	@IBOutlet weak var bottomConstraint: NSLayoutConstraint!
	let fullView: CGFloat = UIScreen.main.bounds.height/8
	var partialView: CGFloat {
		return UIScreen.main.bounds.height/2
	}
	var font = UIFont.systemFont(ofSize: 18.0) {
		didSet {
			headerTitle?.font = font
			headerTitle.textColor = UIColor.darkGray
		}
	}
	var yComponent: CGFloat = 0.0
	override func viewDidLoad() {
		super.viewDidLoad()
		let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(GlobileActionSheetController.panGesture))
		gesture.delegate = self
		view.layer.cornerRadius = 8.0
		view.layer.masksToBounds = true
		view.addGestureRecognizer(gesture)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		prepareBackgroundView()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		var distanceBottom: CGFloat
		if #available(iOS 11.0, *) {
			distanceBottom = CGFloat(UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0)
		} else {
			distanceBottom = bottomLayoutGuide.length
		}
		if distanceBottom == 0.0 {
			distanceBottom = 68
		} else {
			distanceBottom = 100
		}
		UIView.animate(withDuration: 0.6, animations: { [weak self] in
			
			//  self?.view.superview?.addSubview(overlayview)
			// self?.view.superview?.sendSubviewToBack(overlayview)
			let frame = self?.view.frame
			self?.yComponent = self?.partialView ?? 0.0
			self?.view.frame = CGRect(x: 0, y: self?.yComponent ?? 0.0, width: frame!.width, height: frame!.height - distanceBottom)
		})
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@objc func panGesture(_ recognizer: UIPanGestureRecognizer) {
		
		let translation = recognizer.translation(in: self.view)
		let velocity = recognizer.velocity(in: self.view)
		
		let yValue = self.view.frame.minY
		if (yValue + translation.y >= fullView) && (yValue + translation.y <= partialView) {
			self.view.frame = CGRect(x: 0, y: yValue + translation.y, width: view.frame.width, height: view.frame.height)
			recognizer.setTranslation(CGPoint.zero, in: self.view)
		}
		
		if recognizer.state == .ended {
			var duration =  velocity.y < 0 ? Double((yValue - fullView) / -velocity.y) : Double((partialView - yValue) / velocity.y )
			
			duration = duration > 1.3 ? 1 : duration
			if velocity.y > 0 {
				duration = 1.0
			}
			UIView.animate(withDuration: duration, delay: 0.0, options: [.allowUserInteraction], animations: {
				if  velocity.y == 0 {
					self.yComponent = self.partialView
					self.view.frame = CGRect(x: 0, y: self.partialView, width: self.view.frame.width, height: self.view.frame.height)
				} else if  velocity.y > 0 {
					if self.yComponent == self.fullView {
						self.yComponent = self.partialView
						self.view.frame = CGRect(x: 0, y: self.partialView, width: self.view.frame.width, height: self.view.frame.height)
					} else {
						self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: self.view.frame.width, height: self.view.frame.height)
						self.closeActionSheetInternal(delay: duration)
					}
				} else {
					self.yComponent = self.fullView
					self.view.frame = CGRect(x: 0, y: self.fullView, width: self.view.frame.width, height: self.view.frame.height)
				}
				
			}, completion: { [weak self] _ in
				if (velocity.y < 0) {
					var scrollView: UIScrollView?
					var tableView: UITableView?
					for view in self!.containerView!.subviews {
						if view.isKind(of: UITableView.self) {
							tableView = view as? UITableView
							break
						}
						if view.isKind(of: UIScrollView.self) {
							scrollView = view as? UIScrollView
							break
						}
					}
					if let tb = tableView {
						tb.isScrollEnabled = true
					} else if let scroll = scrollView {
						scroll.isScrollEnabled = true
					}
					
				}
			})
		}
	}
	
	func prepareBackgroundView() {
		let blurEffect = UIBlurEffect.init(style: .light)
		let visualEffect = UIVisualEffectView.init(effect: blurEffect)
		let bluredView = UIVisualEffectView.init(effect: blurEffect)
		bluredView.contentView.addSubview(visualEffect)
		visualEffect.frame = UIScreen.main.bounds
		bluredView.frame = UIScreen.main.bounds
		view.insertSubview(bluredView, at: 0)
	}
}

extension GlobileActionSheetController: UIGestureRecognizerDelegate {
	// Solution
	func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
		let gesture = (gestureRecognizer as? UIPanGestureRecognizer)
		let direction = gesture?.velocity(in: view).y
		let yValue = view.frame.minY
		var scrollView: UIScrollView?
		var tableView: UITableView?
		for view in containerView.subviews {
			if view.isKind(of: UITableView.self) {
				tableView = view as? UITableView
				break
			}
			if view.isKind(of: UIScrollView.self) {
				scrollView = view as? UIScrollView
				break
			}
		}
		if let tb = tableView {
			if (yValue == fullView && tb.contentOffset.y == 0 && direction! > 0) || (yValue == partialView) {
				tb.isScrollEnabled = false
			} else {
				tb.isScrollEnabled = true
			}
		} else if let scroll = scrollView {
			if (yValue == fullView && scroll.contentOffset.y == 0 && direction! > 0) || (yValue == partialView) {
				scroll.isScrollEnabled = false
			} else {
				scroll.isScrollEnabled = true
			}
		}
		return false
	}
}
extension UIViewController {
	public func createActionSheet(containerView: UIView, title: String) {
		self.navigationController?.navigationBar.layer.zPosition = -1
		for child in self.children {
			if child.isKind(of: GlobileActionSheetController.self) {
				return
			}
		}
		let bundle = Bundle(for: GlobileActionSheetController.self).url(forResource: "SUKit", withExtension: "bundle").flatMap(Bundle.init)
		
		let bottomSheetVC = GlobileActionSheetController(nibName: "GlobileActionSheetController", bundle: bundle)
		
		self.addChild(bottomSheetVC)
		self.view.addSubview(bottomSheetVC.view)
		self.view.bringSubviewToFront(bottomSheetVC.view)
		
		//Background
		let mainWindow = UIApplication.shared.keyWindow!
		let overlayview = UIView(frame: CGRect(x: mainWindow.frame.origin.x, y: mainWindow.frame.origin.y, width: mainWindow.frame.width, height: mainWindow.frame.height))
		overlayview.backgroundColor = .darkGray
		overlayview.tag = 7
		overlayview.alpha =  0.7
		self.view.insertSubview(overlayview, belowSubview: bottomSheetVC.view)
		if let navController = self.navigationController {
			let heightMain = UIApplication.shared.statusBarFrame.height +
				navController.navigationBar.frame.height
			
			let overlayviewNav = UIView(frame: CGRect(x: mainWindow.frame.origin.x, y: mainWindow.frame.origin.y, width: mainWindow.frame.width, height: heightMain))
			overlayviewNav.backgroundColor = .darkGray
			overlayviewNav.tag = 7
			overlayviewNav.alpha =  0.7
			self.navigationController?.view.addSubview(overlayviewNav)
		}
		////
		bottomSheetVC.headerTitle.text = title
		bottomSheetVC.containerView.addSubview(containerView)
		bottomSheetVC.containerView.translatesAutoresizingMaskIntoConstraints = false
		
		//Constrains ContainerView
		
		containerView.translatesAutoresizingMaskIntoConstraints = false
		containerView.topAnchor.constraint(equalTo: bottomSheetVC.containerView.topAnchor).isActive = true
		containerView.leftAnchor.constraint(equalTo: bottomSheetVC.containerView.leftAnchor).isActive = true
		containerView.bottomAnchor.constraint(equalTo: bottomSheetVC.containerView.bottomAnchor).isActive = true
		containerView.rightAnchor.constraint(equalTo: bottomSheetVC.containerView.rightAnchor).isActive = true
		//
		
		bottomSheetVC.didMove(toParent: self)
		let height = view.frame.height
		let width  = view.frame.width
		bottomSheetVC.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: width, height: height)
	}
	
	public func closeActionSheet(delay: Double = 0.5) {
		var actionSheet: UIViewController?
		for child in self.children {
			if child.isKind(of: GlobileActionSheetController.self) {
				actionSheet = child
				break
			}
		}
		
		if let actionSheet = actionSheet {
			if let navController = actionSheet.navigationController {
				for view in navController.view.subviews {
					if view.tag == 7 {
						UIView.animate(withDuration: 0.5, delay: delay, options: [.allowUserInteraction], animations: {              view.removeFromSuperview()
						})
					}
				}
			}
			if let parent = actionSheet.parent {
				for view in parent.view.subviews {
					if view.tag == 7 {
						UIView.animate(withDuration: 0.5, delay: delay, options: [.allowUserInteraction], animations: {              view.removeFromSuperview()
						})
					}
				}
			}
			UIView.animate(withDuration: 0.5, delay: delay,options: [.allowAnimatedContent], animations: {
				actionSheet.view.removeFromSuperview()
				actionSheet.removeFromParent()
			})
			self.navigationController?.navigationBar.layer.zPosition = 0
		}
	}
	
	func closeActionSheetInternal(delay: Double = 0.5) {
		if let navController = self.navigationController {
			for view in navController.view.subviews  {
				if view.tag == 7 {
					UIView.animate(withDuration: 0.5, delay: delay, options: [.allowUserInteraction], animations: {              view.removeFromSuperview()
					})
				}
			}
		}
		if let parent = self.parent {
			for view in parent.view.subviews {
				if view.tag == 7 {
					UIView.animate(withDuration: 0.5, delay: delay, options: [.allowUserInteraction], animations: {              view.removeFromSuperview()
					})
				}
			}
		}
		self.removeFromParent()
		self.navigationController?.navigationBar.layer.zPosition = 0
	}
}

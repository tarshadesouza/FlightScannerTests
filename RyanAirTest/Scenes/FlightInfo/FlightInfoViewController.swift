//
//  FlightInfoViewController.swift
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Foundation

enum TravelType: String {
	case origin
	case destination
}

protocol FlightInfoViewProtocol: class {
	func returnStations(viewModel: FlightInfo.Model.ViewModel)
}

class FlightInfoViewController: UIViewController {
	
	@IBOutlet var steppers: [UIStepper]! {
		didSet {
			steppers.forEach { component in
				component.maximumValue = maxStepperValue
			}
		}
	}

	@IBOutlet weak var originButton: UIButton!
	@IBOutlet weak var destinationButton: UIButton!
	@IBOutlet weak var outgoingTxtFld: UITextField! {
		didSet {
			outgoingTxtFld.placeholder = "Outgoing date"
		}
	}
	
	@IBOutlet weak var adultsLbl: UILabel! {
		didSet {
			adultsLbl.text = "adults"
		}
	}

	@IBOutlet weak var adultsCounterLbl: UILabel! {
		didSet {
			adultsCounterLbl.text = initalCounterValue
		}
	}
	
	@IBOutlet weak var teenagersCounterLbl: UILabel! {
		didSet {
			teenagersCounterLbl.text = initalCounterValue
		}
	}
	
	@IBOutlet weak var teenagersLbl: UILabel! {
		didSet {
			teenagersLbl.text = "teenagers"
		}
	}

	@IBOutlet weak var childrenCounterLbl: UILabel! {
		didSet {
			childrenCounterLbl.text = initalCounterValue
		}
	}
	
	@IBOutlet weak var childrenLabel: UILabel! {
		didSet {
			childrenLabel.text = "children"
		}
	}
	
	@IBOutlet weak var searchButton: UIButton!
	
	private var datePicker: UIDatePicker?
	private var interactor: FlightInfoInteractorProtocol?
	var stations: [Station]?
	var router: FlightInfoRouterProtocol?
	let searchContentView = SearchInfoView()
	private let maxStepperValue = 6.0
	private let initalCounterValue = "0"
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		initScene()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		initScene()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configDatePicker()
		interactor?.getStations()
	}
	
	private func showStationPicker(with direction: TravelType) {
		createActionSheet(containerView: searchContentView, title: direction.rawValue)
	}
	
	private func configDatePicker() {
		datePicker = UIDatePicker()
		datePicker?.datePickerMode = .date
		datePicker?.addTarget(self, action: #selector(FlightInfoViewController.dateChanged(datePicker:)), for: .valueChanged)
		hideKeyboardWhenTappedAround()
		outgoingTxtFld.inputView = datePicker
	}
	
	@objc private func dateChanged(datePicker: UIDatePicker) {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd/MM/yyyy"
		outgoingTxtFld.text = formatter.string(from: datePicker.date)
		view.endEditing(true)
	}
		
	private func initScene() {
		let presenter = FlightInfoPresenter(view: self)
		let repository = RemoteRepository()
		interactor = FlightInfoInteractor(presenter: presenter, repository: repository)
		router = FlightInfoRouter(view: self, dataStore: interactor)
	}
	
	// MARK: IBOutlet Actions
	
	@IBAction func didTapOriginBtn(_ sender: UIButton) {
		showStationPicker(with: .origin)
	}
	
	@IBAction func didTapDestinationBtn(_ sender: UIButton) {
		showStationPicker(with: .destination)
	}
	
	@IBAction func didTapStepper(_ sender: UIStepper) {
		switch sender.tag {
		case 0:
			adultsCounterLbl.text = "\(sender.value.cleanValue)"
		case 1:
			teenagersCounterLbl.text = "\(sender.value.cleanValue)"
		case 2:
			childrenCounterLbl.text = "\(sender.value.cleanValue)"
		default:
			return
		}
	}
	
	@IBAction func didTapSearchBtn(_ sender: UIButton) {
	}
}

//Routing
extension FlightInfoViewController {
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let scene = segue.identifier {
			let selector = Selector(("routeTo\(scene):"))
			if let router = router, router.responds(to: selector) {
				router.perform(selector, with: segue)
			}
		}
	}
	
	private func routeToSomewhere() {
		router?.routeToSomewhere(nil)
	}
}

//Presentation
extension FlightInfoViewController: FlightInfoViewProtocol {
	func returnStations(viewModel: FlightInfo.Model.ViewModel) {
		stations = viewModel.stations
		searchContentView.stations = stations
	}
}

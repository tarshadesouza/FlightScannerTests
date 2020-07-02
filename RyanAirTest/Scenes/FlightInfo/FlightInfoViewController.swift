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

protocol FlightInfoViewProtocol: class {
	func returnStations(viewModel: FlightInfo.Model.ViewModel)
}

class FlightInfoViewController: UIViewController {
	
	@IBOutlet weak var originButton: UIButton!
	@IBOutlet weak var destinationButton: UIButton!
	@IBOutlet weak var outgoingButton: UIButton!
	
	@IBOutlet weak var adultsLbl: UILabel! {
		didSet {
			adultsLbl.text = "adults"
		}
	}
	@IBOutlet weak var adultStepper: UIStepper!
	
	@IBOutlet weak var teenagersLbl: UILabel! {
		didSet {
			teenagersLbl.text = "teenagers"
		}
	}
	@IBOutlet weak var teenageStepper: UIStepper!
	
	@IBOutlet weak var childrenLabel: UILabel! {
		didSet {
			childrenLabel.text = "children"
		}
	}
	@IBOutlet weak var childStepper: UIStepper!
	
	@IBOutlet weak var searchButton: UIButton!
	
	@IBOutlet weak var datePicker: UIDatePicker! {
		didSet {
			datePicker.isHidden = true
		}
	}
	
	var router: FlightInfoRouterProtocol?
	private var interactor: FlightInfoInteractorProtocol?
	let searchContentView = SearchInfoView()
	
	var stations: [Station]?
	
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
		doSomething()
		configView()
		interactor?.getStations()
		
//		let searchContentView = SearchInfoView(results: stations)

	}
	
	private func configView() {
		
	}
	
	private func getStations() {
		
	}
	
	private func initScene() {
		let presenter = FlightInfoPresenter(view: self)
		let repository = RemoteRepository()
		interactor = FlightInfoInteractor(presenter: presenter, repository: repository)
		router = FlightInfoRouter(view: self, dataStore: interactor)
	}
	
	//MARK: IBOutlet Actions
	
	@IBAction func didTapOriginBtn(_ sender: UIButton) {
	}
	
	@IBAction func didTapDestinationBtn(_ sender: UIButton) {
	}
	
	@IBAction func didTapOutgoingBtn(_ sender: UIButton) {
	}
	
	@IBAction func didTapAdultStepper(_ sender: UIStepper) {
	}
	
	@IBAction func didTapTeenageStepper(_ sender: UIStepper) {
	}
	
	@IBAction func didTapChildStepper(_ sender: UIStepper) {
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

//Interaction
extension FlightInfoViewController {
	
	func doSomething() {
		
		//		let request = FlightInfo.Model.Request(requestQuery: FlightRequest())
		//        interactor?.doSomething(request: request)
	}
}

//Presentation
extension FlightInfoViewController: FlightInfoViewProtocol {
	func returnStations(viewModel: FlightInfo.Model.ViewModel) {
		print("RETURNED", viewModel.stations?.count)
		stations = viewModel.stations
		
		searchContentView.stations = stations
		createActionSheet(containerView: searchContentView, title: "this is a test")
	}
}

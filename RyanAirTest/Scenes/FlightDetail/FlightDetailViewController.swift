//
//  FlightDetailViewController.swift
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FlightDetailViewProtocol: class {
	func displaySomething(viewModel: FlightDetail.Model.ViewModel)
}

class FlightDetailViewController: UIViewController {
		
	var router: FlightDetailRouterProtocol?
	private var interactor: FlightDetailInteractorProtocol?
	var request: FlightDetail.Model.Request?
	
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
		getFlights()
	}
	
	private func initScene() {
		let presenter = FlightDetailPresenter(view: self)
		interactor = FlightDetailInteractor(presenter: presenter)
		router = FlightDetailRouter(view: self, dataStore: interactor)
	}
}

//Routing
extension FlightDetailViewController {
	private func routeToSomewhere() {
		router?.routeToSomewhere(nil)
	}
}

//Interaction
extension FlightDetailViewController {
	
	func getFlights() {
		guard let request = request else {
			return
		}
		interactor?.getFlights(request: request)
	}
}

//Presentation
extension FlightDetailViewController: FlightDetailViewProtocol {
	func displaySomething(viewModel: FlightDetail.Model.ViewModel) {
		//nameTextField.text = viewModel.name
	}
}

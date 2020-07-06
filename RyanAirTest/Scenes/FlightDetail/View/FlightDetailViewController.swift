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
	func displayFlights(viewModel: FlightDetail.Model.ViewModel)
	func showError()
}

class FlightDetailViewController: UIViewController, AttentionView {
		
	@IBOutlet weak var spinner: UIActivityIndicatorView! {
		didSet {
			spinner.isHidden = true
		}
	}
	
	@IBOutlet weak var tableView: UITableView!
	
	var router: FlightDetailRouterProtocol?
	private var interactor: FlightDetailInteractorProtocol?
	var request: FlightDetail.Model.Request?
	var flights: [FlightViewObject]?
	
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
		configTableView()
		getFlights()
	}
	
	private func initScene() {
		let presenter = FlightDetailPresenter(view: self)
		interactor = FlightDetailInteractor(presenter: presenter)
		router = FlightDetailRouter(view: self, dataStore: interactor)
	}
	
	private func configTableView() {
		tableView.register(UINib(nibName: "FlightDetailTableViewCell", bundle: nil), forCellReuseIdentifier: FlightDetailTableViewCell.defaultReuseIdentifier)
		tableView.delegate = self
		tableView.dataSource = self
	}
	
	func showError() {
		presentErrorAlert(message: "Looks like we experienced an error 😅") { (_, _) in
			self.navigationController?.popViewController(animated: true)
		}
	}
	
	private func showSpinner(show: Bool) {
		if show {
			spinner.isHidden = false
			spinner.startAnimating()
		} else {
			spinner.stopAnimating()
			spinner.isHidden = true
		}
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
		showSpinner(show: true)
		guard let request = request else {
			return
		}
		interactor?.getFlights(request: request)
	}
}

//Presentation
extension FlightDetailViewController: FlightDetailViewProtocol {
	func displayFlights(viewModel: FlightDetail.Model.ViewModel) {
		showSpinner(show: false)
		flights = viewModel.flights
		tableView.reloadData()
	}
}

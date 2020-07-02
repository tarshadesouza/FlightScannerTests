//
//  FlightDetailInteractor.swift
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FlightDetailInteractorProtocol: FlightDetailBusinessLogicProtocol, FlightDetailDataStoreProtocol {
}

protocol FlightDetailBusinessLogicProtocol {
	func getFlights(request: FlightDetail.Model.Request)
}

protocol FlightDetailDataStoreProtocol {
}

class FlightDetailInteractor: FlightDetailInteractorProtocol {
	var repository: FlightsRepositoryProtocol?
	var presenter: FlightDetailPresenterProtocol
	
	init(presenter: FlightDetailPresenterProtocol, repository: FlightsRepositoryProtocol = FlightsRepository()) {
		self.repository = repository
		self.presenter = presenter
	}
	
	func getFlights(request: FlightDetail.Model.Request) {
		let req = request.flightRequest
		repository?.retrieveFlights(with: req, completion: { (result) in
			switch result {
			case .success(let trips):
				let response = FlightDetail.Model.Response(trips: trips)
				self.presenter.returnFlights(response: response)
			case .failure(let error):
				safeprint(error)
			}
		})
	}
}

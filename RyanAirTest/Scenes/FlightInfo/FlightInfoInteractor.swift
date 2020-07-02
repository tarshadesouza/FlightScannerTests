//
//  FlightInfoInteractor.swift
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FlightInfoInteractorProtocol: FlightInfoBusinessLogicProtocol, FlightInfoDataStoreProtocol {
}

protocol FlightInfoBusinessLogicProtocol {
	func getStations()
}

protocol FlightInfoDataStoreProtocol {
}

class FlightInfoInteractor: FlightInfoInteractorProtocol {
	var repository: StationRepositoryProtocol?
	var presenter: FlightInfoPresenterProtocol
	
	init(presenter: FlightInfoPresenterProtocol, repository: StationRepositoryProtocol = StationsRepository()) {
		self.repository = repository
		self.presenter = presenter
	}
	
	func getStations() {
		repository?.retrieveStations(completion: { (stationsResult) in
			switch stationsResult {
			case .success(let stations):
				let response = FlightInfo.Model.Response(stationsObject: stations)
				self.presenter.returnStations(response: response)
			case .failure(let error):
				safeprint(error)
			}
		})
	}
}

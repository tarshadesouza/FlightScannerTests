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
  func getStations(request: FlightInfo.Model.Request)
}

protocol FlightInfoDataStoreProtocol {
}

class FlightInfoInteractor: FlightInfoInteractorProtocol {
	var repository: Repository?
    var presenter: FlightInfoPresenterProtocol
  
	init(presenter: FlightInfoPresenterProtocol, repository: Repository) {
		self.repository = repository
        self.presenter = presenter
    }

    func getStations(request: FlightInfo.Model.Request) {
		
        let response = FlightInfo.Model.Response()
        presenter.presentSomething(response: response)
    }
}

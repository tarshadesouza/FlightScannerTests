//
//  FlightInfoRouter.swift
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FlightInfoRouterProtocol: NSObjectProtocol, FlightInfoRoutingLogicProtocol, FlightInfoDataPassingProtocol {
	 var viewController: FlightInfoViewController? { get set }
}

protocol FlightInfoRoutingLogicProtocol {
	func toFindFlights(with request: FlightRequest)
}

protocol FlightInfoDataPassingProtocol {
	var dataStore: FlightInfoDataStoreProtocol? { get }
}

class FlightInfoRouter: NSObject, FlightInfoRouterProtocol {
	
	weak var viewController: FlightInfoViewController?
	weak var view: FlightInfoViewProtocol?
	var dataStore: FlightInfoDataStoreProtocol?
	
	init(view: FlightInfoViewProtocol, dataStore: FlightInfoDataStoreProtocol?) {
		self.view = view
		self.dataStore = dataStore
	}
	
	func toFindFlights(with request: FlightRequest) {
		guard let flightInfoVC = viewController else { return }
		let flightDetailVC = FlightDetailViewController()
		let request = FlightDetail.Model.Request(flightRequest: request)
		flightDetailVC.request = request
		flightInfoVC.show(flightDetailVC, sender: self)
	}
}

//
//  FlightDetailRouter.swift
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  This file was generated by the Globile Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

// MARK: This is boiler plate code for now. Pending further clarification of flow.
protocol FlightDetailRouterProtocol: NSObjectProtocol, FlightDetailRoutingLogicProtocol, FlightDetailDataPassingProtocol {
}

@objc protocol FlightDetailRoutingLogicProtocol {
	func routeToSomewhere(_ segue: UIStoryboardSegue?)
}

protocol FlightDetailDataPassingProtocol {
	var dataStore: FlightDetailDataStoreProtocol? { get }
}

class FlightDetailRouter: NSObject, FlightDetailRouterProtocol {
	
	weak var view: FlightDetailViewProtocol?
	var dataStore: FlightDetailDataStoreProtocol?
	
	init(view: FlightDetailViewProtocol,
		 dataStore: FlightDetailDataStoreProtocol?) {
		self.view = view
		self.dataStore = dataStore
	}
	
	func routeToSomewhere(_ segue: UIStoryboardSegue?) {
	}
}
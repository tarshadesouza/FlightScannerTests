//
//  FlightInfoRouterMock.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 06/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//
import UIKit
@testable import RyanAirTest

class FlightInfoRouterMock: NSObject, FlightInfoRouterProtocol {
	
	var viewController: FlightInfoViewController?
	var dataStore: FlightInfoDataStoreProtocol?
	var didRouteToFindFlights = false
	
	func toFindFlights(with request: FlightRequest) {
		didRouteToFindFlights = true
	}
}

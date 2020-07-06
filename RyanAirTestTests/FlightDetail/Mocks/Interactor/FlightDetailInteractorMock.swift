//
//  FlightDetailInteractorMock.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

@testable import RyanAirTest

class FlightDetailInteractorMock: FlightDetailInteractorProtocol {
	var didGetFlights = false
	func getFlights(request: FlightDetail.Model.Request) {
		didGetFlights = true
	}
}

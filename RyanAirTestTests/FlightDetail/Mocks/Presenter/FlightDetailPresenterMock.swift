//
//  FlightDetailPresenterMock.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

@testable import RyanAirTest

class FlightDetailPresenterMock: FlightDetailPresenterProtocol {
	var didReturnFlights = false
	var didFailToGetFlightsCalled = false
	
	func returnFlights(response: FlightDetail.Model.Response) {
		didReturnFlights = true
	}
	
	func didFailToGetFlights() {
		didFailToGetFlightsCalled = true
	}
}

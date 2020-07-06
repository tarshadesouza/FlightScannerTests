//
//  FlightInfoPresenterMock.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

@testable import RyanAirTest

class FlightInfoPresenterMock: FlightInfoPresenterProtocol {
	
	var didReturnStations = false
	var didFailToGetStationsCalled = false
	
	func returnStations(response: FlightInfo.Model.Response) {
		didReturnStations = true
	}
	
	func didFailToGetStations() {
		didFailToGetStationsCalled = true
	}
}

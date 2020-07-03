//
//  FlightInfoInteractorMock.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

@testable import RyanAirTest

class FlightInfoInteractorMock: FlightInfoInteractorProtocol {
	var didGetStations = false
	
	func getStations() {
		didGetStations = true
	}
}

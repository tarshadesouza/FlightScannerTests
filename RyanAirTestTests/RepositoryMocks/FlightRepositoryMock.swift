//
//  FlightRepositoryMock.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//
import Alamofire

@testable import RyanAirTest

class FlightRepositoryMock: FlightsRepositoryProtocol {
	var retrieveFlightsCalled = false
	var returnSuccess = true
	
	func retrieveFlights(with flightRequest: FlightRequest, completion: @escaping (TripsResult) -> Void) {
		retrieveFlightsCalled = true
		if returnSuccess {
			let flightObj = Mocks.load("flights", as: Trips.self)
			completion(.success(flightObj))
		} else {
			completion(.failure(.parameterEncodingFailed(reason: .jsonEncodingFailed(error: CommonApiError.genericError))))
		}
	}
}

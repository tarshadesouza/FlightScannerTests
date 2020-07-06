//
//  StationRepositoryMock.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Alamofire

@testable import RyanAirTest

class StationRepositoryMock: StationRepositoryProtocol {
	var retrieveStationsCalled = false
	var returnSuccess = true
	
	func retrieveStations(completion: @escaping (StationsResult) -> Void) {
		retrieveStationsCalled = true
		if returnSuccess {
			let stationObj = Mocks.load("stations", as: StationInfo.self)
			completion(.success(stationObj))
		} else {
			completion(.failure(.parameterEncodingFailed(reason: .jsonEncodingFailed(error: CommonApiError.genericError))))
		}
	}
}

//
//  FlightsRepository.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import Alamofire

typealias TripsResult = Swift.Result<Trips, AFError>

protocol FlightsRepositoryProtocol {
	func retrieveFlights(with flightRequest: FlightRequest, completion: @escaping (TripsResult) -> Void)
}

/// Manages connection to the backend for Flights
class FlightsRepository: BaseRepository, FlightsRepositoryProtocol {

	init() {
		super.init(manager: RequestManager())
	}
	
	func retrieveFlights(with flightRequest: FlightRequest, completion: @escaping (TripsResult) -> Void) {
		let queryObj = RyanAirEndPoints.retrieveFlights(queryString: flightRequest)
		manager.request(queryObj)?.logResponse().responseDecodable { (response: DataResponse<Trips, AFError>) in
			completion(response.result)
		}
	}
}

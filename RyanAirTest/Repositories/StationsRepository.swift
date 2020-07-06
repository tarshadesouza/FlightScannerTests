//
//  RemoteRepository.swift
//  RyanAirTest
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import Alamofire

typealias StationsResult = Swift.Result<StationInfo, AFError>

protocol StationRepositoryProtocol {
    func retrieveStations(completion: @escaping (StationsResult) -> Void)
}

/// Manages connection to the backend for Stations
class StationsRepository: BaseRepository, StationRepositoryProtocol {
	
	init() {
		super.init(manager: RequestManager())
	}
	
	func retrieveStations(completion: @escaping (StationsResult) -> Void) {
		 let queryObj = RyanAirEndPoints.retrieveStations
		manager.request(queryObj)?.logResponse().responseDecodable { (response: DataResponse<StationInfo, AFError>) in
			completion(response.result)
		}
	}
}

//
//  RemoteRepository.swift
//  RyanAirTest
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import Alamofire

typealias StationsResult = Swift.Result<Station, AFError>

protocol Repository {
    func retrieveStations(completion: @escaping (StationsResult) -> Void)
//    func retrieveCharactersViaName<T>(queryString: String, completion: @escaping (T?, Error?) -> Void)
}

/// Manages connection to the backend
struct RemoteRepository: Repository {
	
	func retrieveStations(completion: @escaping (StationsResult) -> Void) {
		let queryObj = RyanAirEndPoints.retrieveStations
		AF.request(queryObj.baseURLString, method: queryObj.httpMethod, parameters: queryObj.params, encoding: JSONEncoding.default, headers: nil).responseDecodable {
			(response: DataResponse<Station, AFError>) in
			completion(response.result)
		}
	}
	
	
}

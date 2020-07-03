//
//  EndPoints.swift
//  RyanAirTest
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import Alamofire

public enum RyanAirEndPoints {
	case retrieveStations
	case retrieveFlights(queryString: FlightRequest)
}

extension RyanAirEndPoints {
	
	var httpMethod: HTTPMethod {
		switch self {
		case .retrieveStations:
			return .get
			
		case .retrieveFlights:
			return .get
		}
	}
	
	var baseURLString: String {
		switch self {
		case .retrieveStations:
			return "https://tripstest.ryanair.com/"
			
		case .retrieveFlights:
			return "https://tripstest.ryanair.com/"
		}
	}
	
	var path: String? {
		switch self {
		case .retrieveStations:
			return "static/stations.json"
		case .retrieveFlights:
			return "api/v4/Availability"
		}
	}
	
	var params: [String: Any]? {
		switch self {
		case .retrieveStations:
			return nil
		case .retrieveFlights(let query):
			let params = ["origin": query.origin ?? "",
						  "destination": query.destination ?? "",
						  "dateout": query.dateOut ?? "",
						  "adt": query.adults ?? "",
						  "teen": query.teenagers ?? "",
						  "chd": query.children ?? ""]
			return params
		}
	}
	
	var headers: HTTPHeaders {
		switch self {
		case .retrieveStations, .retrieveFlights :
			return  ["Content-Type": "application/json"]
		}
	}
	
	public func asURLRequest() throws -> URLRequest {
		let url = try baseURLString.asURL()
		
		var request = URLRequest(url: url.appendingPathComponent(path ?? ""))
		request.httpMethod = httpMethod.rawValue
		request.timeoutInterval = TimeInterval(10 * 1000)
		
		return try URLEncoding.default.encode(request, with: params)
	}
}

extension Alamofire.DataRequest {
	func logResponse() -> Self {
		return responseJSON { response in
			print("** REQUEST URL: \(String(describing: response.request?.url))")
			if let httpBody = response.request?.httpBody,
				let paramsString = String(data: httpBody, encoding: String.Encoding.utf8) {
				print("** REQUEST Params: \(paramsString)")
			}
			
			switch response.result {
			case .success(let json):
				print("** RESPONSE: # --> #\(json))# #")
			case .failure(let error):
				print("** ERROR LOGGING RESPONSE: \(error.localizedDescription)")
			}
		}
	}
}

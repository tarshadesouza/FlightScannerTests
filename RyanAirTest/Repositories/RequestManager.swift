//
//  RequestManager.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import Alamofire

public class RequestManager {
	let client: Alamofire.Session
	
	public init() {
		self.client = Alamofire.Session(configuration: URLSessionConfiguration.default)
	}
	
	public func request(_ endPoints: RyanAirEndPoints) -> DataRequest? {
		guard let request = try? endPoints.asURLRequest() else {
			return nil
		}
		return client.request(request)
	}
	
	//	public func request<Parameters: Encodable>(_ path: String,
	//											  method: HTTPMethod = .get,
	//											  parameters: Parameters? = nil,
	//											  encoding: ParameterEncoding = URLEncoding.default,
	//											  headers: HTTPHeaders? = nil,
	//											  encoder: ParameterEncoder = URLEncodedFormParameterEncoder.default,
	//											  interceptor: RequestInterceptor? = nil) -> DataRequest {
	//		let url = baseURL.appendingPathComponent(path)
	//		return client.request(url, method: method, parameters: parameters, encoder: encoder, headers: headers, interceptor: interceptor)
	//	}
}

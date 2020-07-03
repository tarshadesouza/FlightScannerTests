//
//  RequestManager.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import Alamofire

/// Main common request manager
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
}

//
//  Alamofire+Extensions.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import Alamofire

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

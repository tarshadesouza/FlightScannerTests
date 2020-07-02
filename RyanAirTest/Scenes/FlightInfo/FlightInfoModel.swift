//
//  FlightInfoModel.swift
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum FlightInfo {
	
	enum Model {
		
		struct Request {
		}
		
		struct Response {
			var stations: [Station]?
		}
		
		struct ViewModel {
			var stations: [Station]?
		}
	}
}

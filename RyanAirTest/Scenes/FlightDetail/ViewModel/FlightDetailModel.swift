//
//  FlightDetailModel.swift
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum FlightDetail {
	
	enum Model {
		
		struct Request {
			var flightRequest: FlightRequest
		}
		
		struct Response {
			var trips: Trips?
		}
		
		struct ViewModel {
			var flights: [FlightViewObject]?
		}
	}
}

//
//  EndPoints.swift
//  RyanAirTest
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import Alamofire

enum RyanAirEndPoints {
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
            return "https://tripstest.ryanair.com/api/Availability"
        }
    }
    
    var path: String? {
        switch self {
        case .retrieveStations:
            return nil
        
        case .retrieveFlights:
            return nil
        }
    }
    
    var params: [String: Any]? {
        switch self {
        case .retrieveStations:
            return nil
        case .retrieveFlights(let query):
            let params = ["origin" : query.origin,
                          "destination" : query.destination,
                          "dateout": query.dateOut,
                          "datein" : query.dateIn,
                          "adt" : query.adults,
                          "teen" : query.teenagers,
                          "chd" :  query.children]
            return params
        }
    }
    
}

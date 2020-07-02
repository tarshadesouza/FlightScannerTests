//
//  FlightRequest.swift
//  RyanAirTest
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

public struct FlightRequest: Encodable {
    
    let origin: String
    let destination: String
    let dateOut: String
    let dateIn: String
    let adults: String
    let teenagers: String
    let children: String
}

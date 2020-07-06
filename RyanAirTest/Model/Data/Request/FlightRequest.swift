//
//  FlightRequest.swift
//  RyanAirTest
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

///Main flight request all fields optional until further notice
public struct FlightRequest: Encodable {
    let origin: String?
    let destination: String?
    let dateOut: String?
    let adults: String?
    let teenagers: String?
    let children: String?
}

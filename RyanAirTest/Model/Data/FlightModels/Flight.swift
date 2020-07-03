//
//  Flight.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

protocol Flightable {
	var flightNumber: String { get }
}

class Flights: Codable, Flightable {
	var flightNumber: String
	var regularFare: Fares
}

struct FlightViewObject {
	var dateOut: String
	var fareAmount: [Double]
	var flightNumber: [String]
	
	init(dateOut: String, fareAmount: [Double], flightNumber: [String]) {
		self.dateOut = dateOut
		self.fareAmount = fareAmount
		self.flightNumber = flightNumber
	}
}

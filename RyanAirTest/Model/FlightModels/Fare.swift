//
//  Fare.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

protocol FareObject {
	var amount: Double { get }
}

struct Fare: Codable, FareObject {
	var amount: Double
}

class Fares: Codable {
	var fares: [Fare]
}

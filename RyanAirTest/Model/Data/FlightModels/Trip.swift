//
//  Trip.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

struct Trip: Codable {
	let dates: [Dates]
}

class Trips: Codable {
	let trips: [Trip]
}

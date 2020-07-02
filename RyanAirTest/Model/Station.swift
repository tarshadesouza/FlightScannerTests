//
//  Station.swift
//  RyanAirTest
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

 class Station: Codable {
	var name: String
	var countryName: String
	
	enum CodingKeys: String, CodingKey {
		case name
		case countryName
	}
}

class StationInfo: Codable {
	let stations: [Station]
	
	enum CodingKeys: String, CodingKey {
		case stations
	}
}

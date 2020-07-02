//
//  Station.swift
//  RyanAirTest
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

protocol StationViewObjectProtocol {
	var travelDirection: TravelType? { get set }
}

class Station: Codable, StationViewObjectProtocol {
	var travelDirection: TravelType?
	var name: String
	var code: String
	
	enum CodingKeys: String, CodingKey {
		case name
		case code
	}
}

class StationInfo: Codable {
	let stations: [Station]
	
	enum CodingKeys: String, CodingKey {
		case stations
	}
}

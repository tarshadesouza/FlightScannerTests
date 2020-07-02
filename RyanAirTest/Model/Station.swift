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

protocol StationViewObjectProtocol {
	var stationCode: String? { get set }
	var travelDirection: TravelType? { get set }
}

struct SelectedStation: StationViewObjectProtocol {
	var stationCode: String?
	var travelDirection: TravelType?
}

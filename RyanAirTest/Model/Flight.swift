//
//  Flight.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

protocol Flight {
	var flightNumber: String { get }
	var regularFare: [Fare] { get }
}

class Flights: Codable, Flight {
	var flightNumber: String
	var regularFare: [Fare]
	
	enum CodingKeys: String, CodingKey {
		case flightNumber
		case regularFare
	}
}

class Dates: Codable {
	let dateOut: String
	let flights: [Flights]
	
	enum CodingKeys: String, CodingKey {
		case dateOut
		case flights
	}
}

class Trips: Codable {
	let dates: [Dates]
	
	enum CodingKeys: String, CodingKey {
		case dates
	}
}

//The form should also include a search button to call the server to retrieve the response and
//present the results on a list with date, flight number and regular fare.

protocol FareObject {
	var amount: Int { get }
}

struct Fare: Codable, FareObject {
	var amount: Int
	
	enum CodingKeys: Int, CodingKey {
		case amount
	}
}

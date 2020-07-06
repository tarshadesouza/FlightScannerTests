//
//  XCTestExtension.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import XCTest

class Mocks {
	static func load<T: Decodable>(_ filename: String, fileExtension: String = "json", as type: T.Type = T.self) -> T {
		let data: Data
		
		guard let filePath = Bundle(for: FlightDetailPresenterMock.self).path(forResource: filename, ofType: fileExtension)
			else {
				fatalError("Couldn’t find \(filename) in main bundle.")
		}
		
		let file = URL(fileURLWithPath: filePath)
		do {
			data = try Data(contentsOf: file)
		} catch {
			fatalError("Couldn’t load \(filename) from main bundle:\n\(error)")
		}
		
		do {
			let decoder = JSONDecoder()
			return try decoder.decode(T.self, from: data)
		} catch {
			fatalError("Couldn’t parse \(filename) as \(T.self):\n\(error)")
		}
	}
}

//
//  Number+Extensions.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation

extension Double {
	var cleanValue: String {
		return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.2f", self)//
	}
}

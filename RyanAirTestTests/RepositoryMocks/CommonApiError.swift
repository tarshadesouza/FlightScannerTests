//
//  CommonApiError.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

enum CommonApiError: Error {
	case genericError
	
	var localizedDescription: String {
		switch self {
		case .genericError:
			return "Something went wrong"
		}
	}
}

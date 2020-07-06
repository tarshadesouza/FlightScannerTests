//
//  FlightDetailViewControllerMock.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 06/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

@testable import RyanAirTest

class FlightDetailViewControllerMock: FlightDetailViewProtocol {
	
	var didDisplayFlights = false
	var didShowError = false
	
	func displayFlights(viewModel: FlightDetail.Model.ViewModel) {
		didDisplayFlights = true
	}
	
	func showError() {
		didShowError = true
	}
}

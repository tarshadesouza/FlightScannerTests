//
//  FlightInfoViewControllerMock.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 06/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

@testable import RyanAirTest

class FlightInfoViewControllerMock: FlightInfoViewProtocol {
	
	var didReturnStations = false
	var didShowError = false
	
	func returnStations(viewModel: FlightInfo.Model.ViewModel) {
		didReturnStations = true
	}
	
	func showError() {
		didShowError = true
	}
}

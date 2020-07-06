//
//  FlightDetailInteractorTests.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import XCTest

@testable import RyanAirTest

class FlightDetailInteractorTests: XCTestCase {
	
	var presenterMock: FlightDetailPresenterMock!
	var interactor: FlightDetailInteractor!
	var flightRepositoryMock: FlightRepositoryMock!
	
	let request = FlightDetail.Model.Request(flightRequest: FlightRequest(origin: "",
																		  destination: "",
																		  dateOut: "",
																		  adults: "",
																		  teenagers: "",
																		  children: ""))
	
	override func setUp() {
		flightRepositoryMock = FlightRepositoryMock()
		presenterMock = FlightDetailPresenterMock()
		interactor = FlightDetailInteractor(presenter: presenterMock, repository: flightRepositoryMock)
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testGetFlightsOK() {
		//Given
		flightRepositoryMock.returnSuccess = true
		
		//When
		interactor.getFlights(request: request)
		
		//Then
		XCTAssert(presenterMock.didReturnFlights, "could not get flights")
	}
	
	func testGetFlightsKO() {
		//Given
		flightRepositoryMock.returnSuccess = false
		
		//When
		interactor.getFlights(request: request)
		
		//Then
		XCTAssert(presenterMock.didFailToGetFlightsCalled, "Unexpected behavior.")
	}
}

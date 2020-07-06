//
//  FlightDetailPresenterTests.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 06/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import XCTest

@testable import RyanAirTest

class FlightDetailPresenterTests: XCTestCase {
	
	var presenter: FlightDetailPresenter!
	var viewMock: FlightDetailViewControllerMock!
	
	override func setUp() {
		viewMock = FlightDetailViewControllerMock()
		presenter = FlightDetailPresenter(view: viewMock)
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testReturnFlights() {
		//Given
		let mockResponse = Mocks.load("flights", as: Trips.self)
		
		//When
		presenter.returnFlights(response: FlightDetail.Model.Response(trips: mockResponse))
		
		//Then
		XCTAssert(viewMock.didDisplayFlights, "Error could not return flights")
	}
	
	func testDidFailtToGetFlights() {
		//Given
		
		//When
		presenter.didFailToGetFlights()
		
		//Then
		XCTAssert(viewMock.didShowError, "Error was not displayed")
	}
}

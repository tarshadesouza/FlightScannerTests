//
//  FlightInfoPresenterTests.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 06/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import XCTest
@testable import RyanAirTest

class FlightInfoPresenterTests: XCTestCase {
	var presenter: FlightInfoPresenter!
	var viewMock: FlightInfoViewControllerMock!
	
	override func setUp() {
		viewMock = FlightInfoViewControllerMock()
		presenter = FlightInfoPresenter(view: viewMock)
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testReturnStations() {
		//Given
		let mockResponse = Mocks.load("stations", as: StationInfo.self)
		
		//When
		presenter.returnStations(response: FlightInfo.Model.Response(stationsObject: mockResponse))
		
		//Then
		XCTAssert(viewMock.didReturnStations, "Error, could not return stations")
	}
	
	func testdidFailToGetStatiosn() {
		//Given
		
		//When
		presenter.didFailToGetStations()
		
		//Then
		XCTAssert(viewMock.didShowError, "Error was not shown")
	}
	
}

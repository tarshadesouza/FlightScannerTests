//
//  FlightInfoInteractorTests.swift
//  RyanAirTestTests
//
//  Created by Tarsha De Souza on 06/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import XCTest

@testable import RyanAirTest

class FlightInfoInteractorTests: XCTestCase {
	var presenterMock: FlightInfoPresenterMock!
	var interactor: FlightInfoInteractor!
	var stationRepositoryMock: StationRepositoryMock!
	
    override func setUp() {
		stationRepositoryMock = StationRepositoryMock()
		presenterMock = FlightInfoPresenterMock()
		interactor = FlightInfoInteractor(presenter: presenterMock, repository: stationRepositoryMock)
	}

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	func testGetStationsOK() {
		//Given
		stationRepositoryMock.returnSuccess = true
		
		//When
		interactor.getStations()
		
		//Then
		XCTAssert(presenterMock.didReturnStations, "could not get stations")
	}
	
	func testGetStationsKO() {
		//Given
		stationRepositoryMock.returnSuccess = false
		
		//When
		interactor.getStations()
		
		//Then
		XCTAssert(presenterMock.didFailToGetStationsCalled, "Unexpected behavior")
	}
}

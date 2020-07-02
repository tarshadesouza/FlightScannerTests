//
//  FlightInfoTests.swift
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  This file was generated by the Globile Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import XCTest
@testable import <MODULE_NAME>

class FlightInfoInteractorTests: XCTestCase {
    
	private var presenter: FlightInfoPresenterMock!
	private var interactor: FlightInfoBusinessLogicProtocol!

	override func setUp() {
        super.setUp()
		presenter = FlightInfoPresenterMock()
		interactor = FlightInfoInteractor(presenter: presenter)
	}
	
	override func tearDown() {
		presenter = nil
		interactor = nil
        super.tearDown()
	}

	func testDoSomethingSuccess() {
		let request = FlightInfo.Model.Request()
		_ = interactor.doSomething(request: request)
		XCTAssertTrue(presenter.presentResponseCalled, "Interactor did not call presenter when after successful call")
	}

}
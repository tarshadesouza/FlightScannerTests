//
//  FlightDetailMocks.swift
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  This file was generated by the Globile Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import <MODULE_NAME>

class FlightDetailPresenterMock: FlightDetailPresenterProtocol {
	
		var presentResponseCalled = false
		var presentErrorCalled = false
		
		func presentSomething(response: FlightDetail.Model.Response) {
			presentResponseCalled = true
		}
		
		func present(error: Error) {
			presentErrorCalled = true
		}
}

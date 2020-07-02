//
//  FlightDetailPresenter.swift
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FlightDetailPresenterProtocol {
	func returnFlights(response: FlightDetail.Model.Response)
}

class FlightDetailPresenter: FlightDetailPresenterProtocol {
	
	weak var view: FlightDetailViewProtocol?
	
	init(view: FlightDetailViewProtocol) {
		self.view = view
	}
	
	func returnFlights(response: FlightDetail.Model.Response) {
		let dates = response.trips?.dates
		dates?.forEach({ (test) in
			test.dateOut
			test.flights
			let viewModel = FlightDetail.Model.ViewModel(flights: test.flights)
		})
//		let viewModel = FlightDetail.Model.ViewModel(flights: <#[Flights]#>)
//		view?.displaySomething(viewModel: viewModel)
	}
}

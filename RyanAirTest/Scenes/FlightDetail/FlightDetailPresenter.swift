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
		let trips = response.trips?.trips
		
		let obj = trips.map { createFlightObjects(trips: $0) }
		let viewModel = FlightDetail.Model.ViewModel(flights: obj)
		view?.displayFlights(viewModel: viewModel)
	}
	
	private func createFlightObjects(trips: [Trip]) -> [FlightViewObject] {
		var dates = [Dates]()
		var flights = [Flights]()
		var fares = [Fare]()
		
		var dateOut = ""
		var flightNo = [String]()
		var fareAmount = [Double]()
		
		var totalFoundFlights = [FlightViewObject]()
		
		trips.forEach { trip in
			dates = trip.dates
			
			dates.forEach { date in
				flights = date.flights
				dateOut = date.dateOut
				
				flights.forEach { flight in
					flightNo.append(flight.flightNumber)
					fares = flight.regularFare.fares
					
					fares.forEach { fare in
						fareAmount.append(fare.amount)
					}
				}
			}
			totalFoundFlights.append(FlightViewObject(dateOut: dateOut, fareAmount: fareAmount, flightNumber: flightNo))
		}
		return totalFoundFlights
	}
	
}

//
//  ContentView.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import UIKit

class ContentView: UIView {
	
	init(data: FlightCellModel) {
		super.init(frame: CGRect.zero)
		loadContentView(data: data)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	func loadContentView(data: FlightCellModel) {
		let mainStackContentView = UIStackView()
		addSubview(mainStackContentView)
		mainStackContentView.spacing = 5

		mainStackContentView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			mainStackContentView.leadingAnchor.constraint(equalTo: leadingAnchor),
			mainStackContentView.trailingAnchor.constraint(equalTo: trailingAnchor),
			mainStackContentView.topAnchor.constraint(equalTo: topAnchor),
			mainStackContentView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
		
		let groupView = FlightView(flightNumber: data.flightNumber, amount: data.fareAmount)
		mainStackContentView.addArrangedSubview(groupView)
	}
	
}

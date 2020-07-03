//
//  FlightDetailTableViewCell.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

struct FlightCellModel {
	var fareAmount: Double
	var flightNumber: String
}

class FlightDetailTableViewCell: UITableViewCell {
	
	@IBOutlet weak var flightStack: UIStackView!
	@IBOutlet weak var dateOutLbl: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
	
	func setUp(with flightObject: FlightViewObject) {
		dateOutLbl.text = "date out: \(flightObject.dateOut)"
		
		let displayObj = createFlightCell(with: flightObject)
		displayObj.forEach { cellData in
			//Add display data to custom container view which will then add it to a stackview
			let flightSection = ContentView(data: cellData)
			flightStack.addArrangedView(flightSection, width: flightStack.frame.size.width, height: flightStack.frame.size.height)
		}
	}
	
	// MARK: Creating a FlightCell that contains amount and flight number
	private func createFlightCell(with flightObj: FlightViewObject) -> [FlightCellModel] {
		var fareAmount: Double = 0.0
		var flightNumber = ""
		var totalFlightCells = [FlightCellModel]()
		
		flightObj.flightNumber.forEach { number in
			flightNumber = number
			flightObj.fareAmount.forEach { amount in
				fareAmount = amount
			}
			totalFlightCells.append(FlightCellModel(fareAmount: fareAmount, flightNumber: flightNumber))
		}
		return totalFlightCells
	}
}

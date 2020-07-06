//
//  FlightDetailViewController+Delegates.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import UIKit

/// delegates for flight detailview controller class
extension FlightDetailViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return flights?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(cellType: FlightDetailTableViewCell.self), let flights = flights else {
				return UITableViewCell()
			}
		cell.setUp(with: flights[indexPath.row])
		return cell
	}
}

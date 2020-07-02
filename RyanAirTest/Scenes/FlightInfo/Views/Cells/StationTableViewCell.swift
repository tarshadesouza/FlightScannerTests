//
//  StationTableViewCell.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell {
	
	@IBOutlet weak var nameLbl: UILabel!
	@IBOutlet weak var countryLbl: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
	
	override func prepareForReuse() {
		nameLbl.text = ""
		countryLbl.text = ""
	}
	
	func configureCell(with station: Station) {
		nameLbl.text = station.name
		countryLbl.text = station.countryName
	}
}

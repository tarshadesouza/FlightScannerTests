//
//  StationTableViewCell.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell {
	
	@IBOutlet weak var codeLbl: UILabel!
	@IBOutlet weak var nameLbl: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
	
	override func prepareForReuse() {
		codeLbl.text = ""
		nameLbl.text = ""
	}
	
	func configureCell(with station: Station) {
		codeLbl.text = station.code
		nameLbl.text = station.name
	}
}

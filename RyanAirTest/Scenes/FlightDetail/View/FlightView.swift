//
//  FlightView.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

class FlightView: UIView {
	
	@IBOutlet var contentView: UIView!
	@IBOutlet weak var flightNo: UILabel!
	@IBOutlet weak var amountLbl: UILabel!
		
	init(flightNumber: String, amount: Double) {
		super.init(frame: CGRect.zero)
		commonInit()
		setUp(flightNumber: flightNumber, amount: amount)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
	
	func commonInit() {
		guard let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)?.first as? UIView else { return }
		self.layoutIfNeeded()
		contentView = view
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
		self.addSubview(contentView)
	}
	
	func setUp(flightNumber: String, amount: Double) {
		flightNo.text = flightNumber
		amountLbl.text = "$\(amount)"
	}
}

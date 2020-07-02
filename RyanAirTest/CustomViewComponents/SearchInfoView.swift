//
//  SearchInfoView.swift
//  RyanAirTest
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

enum TravelType: String {
	case origin
	case destination
}

protocol SearchViewDelegate: class {
	func stationSelected(stationCode: StationViewObjectProtocol)
}

public class SearchInfoView: UIView {
	
	let mainStackView = UIStackView()
	let searchBar = UITextField()
	let tableView = UITableView()
	var stations: [Station]? {
		didSet {
			tableView.reloadData()
		}
	}
	var travelDirection: TravelType?
	
	private var filteredData = [Station]()
	private var isSearchActive = false
	
	let noContactsLabel = UILabel()
	
	weak var delegate: SearchViewDelegate?
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		configView()
	}
	
	init(results: [Station]?, travelDirection: TravelType) {
		super.init(frame: .zero)
		self.stations = results
		self.travelDirection = travelDirection
		configView()
	}
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		configView()
	}
	
	private func configView() {
		addSubview(mainStackView)
		addSubview(noContactsLabel)
		configMainStackView()
		configSearchBar()
		configTableView()
	}
	
	private func configMainStackView() {
		mainStackView.axis = .vertical
		mainStackView.alignment = .leading
		mainStackView.translatesAutoresizingMaskIntoConstraints = false
		mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 9).isActive = true
		mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
		mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}
	
	private func configSearchBar() {
		searchBar.placeholder = "Find what your looking for?"
		searchBar.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
		mainStackView.addArrangedSubview(searchBar)
		searchBar.translatesAutoresizingMaskIntoConstraints = false
		searchBar.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -16).isActive = true
	}
	
	private func configTableView() {
		tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.separatorStyle = .none
		tableView.register(UINib(nibName: "StationTableViewCell", bundle: nil), forCellReuseIdentifier: StationTableViewCell.defaultReuseIdentifier)
		mainStackView.addArrangedSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor).isActive = true
	}
	
	func configNoContactsLabel() {
		noContactsLabel.font = UIFont.systemFont(ofSize: 14)
		noContactsLabel.textColor = .darkGray
		noContactsLabel.text = "nothing found"
		noContactsLabel.translatesAutoresizingMaskIntoConstraints = false
		noContactsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		noContactsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 150).isActive = true
	}
	
	@objc func textDidChange(_ sender: UITextField) {
		filteredData = stations ?? [Station]()
		
		sender.text.map {
			if !$0.isEmpty {
				filteredData = stations?.filter({ (station) -> Bool in
					return station.name.lowercased().contains((sender.text?.lowercased())!)
				}) ?? [Station]()
				isSearchActive = true
			} else {
				isSearchActive = false
				stations = filteredData
			}
			tableView.reloadData()
		}
	}
	
	// MARK: Public methods
	public func deselectAllRows() {
		if let index = tableView.indexPathForSelectedRow {
			tableView.deselectRow(at: index, animated: true)
		}
	}
	
}

extension SearchInfoView: UITableViewDataSource, UITableViewDelegate {
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let stationsList = isSearchActive ? filteredData.count : stations?.count
		return stationsList ?? 0
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(cellType: StationTableViewCell.self), let stations = stations else {
			return UITableViewCell()
		}
		let stationsList = isSearchActive ? filteredData[indexPath.row] : stations[indexPath.row]
		
		cell.configureCell(with: stationsList)
		return cell
	}
	
	public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let stations = stations else {
			return
		}
		let data = stations[indexPath.row]
		let selected = SelectedStation(stationCode: data.code, travelDirection: travelDirection)
		delegate?.stationSelected(stationCode: selected)
	}
	
}

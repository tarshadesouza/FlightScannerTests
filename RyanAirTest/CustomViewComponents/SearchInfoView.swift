//
//  SearchInfoView.swift
//  RyanAirTest
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import UIKit

protocol SearchInfoViewProtocol: class {
    func load()
//    func showContacts(_ sections: [ContactSection])
//    func showSearchResults(_ sections: [ContactSection])
}

protocol ContactsViewDelegate: class {
//    func contactSelected(contactsView: ContactsView, contact: ContactCellViewModel)
}

public class SearchInfoView: UIView {
    
    let mainStackView = UIStackView()
    let searchBar = UITextField()
    let resultsList = UITableView()
	var stations: [Station]?
    var providerIcon: UIImage?
    
    let noContactsLabel = UILabel()
    
    weak var delegate: ContactsViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configView()
    }
    
    init(results: [Station]?) {
        super.init(frame: .zero)
		self.stations = results
        configView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        configView()
    }
    
    private func configView() {
//        viewModel.view = self
        addSubview(mainStackView)
        addSubview(noContactsLabel)
        configMainStackView()
		configSearchBar()
        configContactsList()
//        configLoader()
        configNoContactsLabel()
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
    
    private func configContactsList() {
        resultsList.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0)
        resultsList.delegate = self
        resultsList.dataSource = self
        resultsList.separatorStyle = .none
//        contactsList.register(ContactViewCell.self, forCellReuseIdentifier: ContactViewCell.reuseIdentifier)
        mainStackView.addArrangedSubview(resultsList)
        resultsList.translatesAutoresizingMaskIntoConstraints = false
        resultsList.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor).isActive = true
    }
    
//    private func configLoader() {
//        guard let loader = loader else { return }
//        loader.setupLoaderNib(in: self, globileLoader: loader, loaderType: .primary)
//        addSubview(loader)
//        loader.translatesAutoresizingMaskIntoConstraints = false
//        loader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        loader.topAnchor.constraint(equalTo: topAnchor).isActive = true
//    }
    
    func configNoContactsLabel() {
		noContactsLabel.font = UIFont.systemFont(ofSize: 14)
        noContactsLabel.textColor = .darkGray
        noContactsLabel.text = "nothing found"
        noContactsLabel.translatesAutoresizingMaskIntoConstraints = false
        noContactsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        noContactsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 150).isActive = true
    }
    
    @objc func textDidChange(_ sender: UITextField) {
//        sender.text.map {
//            if $0.isEmpty {
//                sections = viewModel.sections
//                noContactsLabel.isHidden = !sections.isEmpty
//                contactsList.reloadData()
//            } else {
//                viewModel.search($0)
//            }
//        }
    }
    
    // MARK: Public methods
//    public func getContacts() -> [SearchCellViewModel] {
//        return viewModel.getParsedContacts()
//    }
    
    public func deselectAllRows() {
        if let index = resultsList.indexPathForSelectedRow {
            resultsList.deselectRow(at: index, animated: true)
        }
    }
    
    public func startLoader() {
//        loader?.isHidden = false
    }
    
    public func endLoader() {
//        loader?.isHidden = true
    }
    
}

extension SearchInfoView: UITableViewDataSource, UITableViewDelegate {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
		return 0
	}
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
    }
    
//    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        delegate?.contactSelected(contactsView: self, contact: sections[indexPath.section].contacts[indexPath.row])
//    }
    
}

extension SearchInfoView: SearchInfoViewProtocol {
    
    // Loads view with stations
    func load() {
//        viewModel.loadContacts(sectionsAreVisible: sectionsAreVisible)
    }
        
//    func showContacts(_ sections: [ContactSection]) {
//        self.sections = sections
//        searchBar.text = ""
//        endLoader()
//        noContactsLabel.isHidden = !sections.isEmpty
//        DispatchQueue.main.async {
//            self.contactsList.reloadData()
//        }
//    }
//
//    func showSearchResults(_ sections: [ContactSection]) {
//        self.sections = sections
//        noContactsLabel.isHidden = !sections.isEmpty
//        DispatchQueue.main.async {
//            self.contactsList.reloadData()
//        }
//    }
}

//
//  FlightInfoPresenter.swift
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FlightInfoPresenterProtocol {
    func presentSomething(response: FlightInfo.Model.Response)
}

class FlightInfoPresenter: FlightInfoPresenterProtocol {
    
    weak var view: FlightInfoViewProtocol?
    
    init(view: FlightInfoViewProtocol) {
        self.view = view
    }
  
    func presentSomething(response: FlightInfo.Model.Response) {
        let viewModel = FlightInfo.Model.ViewModel()
        view?.displaySomething(viewModel: viewModel)
    }
}
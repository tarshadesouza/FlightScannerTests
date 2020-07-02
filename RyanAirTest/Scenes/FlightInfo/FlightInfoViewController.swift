//
//  FlightInfoViewController.swift
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Foundation

protocol FlightInfoViewProtocol: class {
    func displaySomething(viewModel: FlightInfo.Model.ViewModel)
}

class FlightInfoViewController: UIViewController {
    
    var router: FlightInfoRouterProtocol?
    private var interactor: FlightInfoInteractorProtocol?
    
	let searchContentView = SearchInfoView()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initScene()
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initScene()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
		configView()
		
		createActionSheet(containerView: searchContentView, title: "this is a test")
    }
	
	private func configView() {

	}
	
	private func getStations() {
		
	}
  
    private func initScene() {
        let presenter = FlightInfoPresenter(view: self)
        interactor = FlightInfoInteractor(presenter: presenter)
        router = FlightInfoRouter(view: self, dataStore: interactor)
    }
    

}

//Routing
extension FlightInfoViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = Selector(("routeTo\(scene):"))
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    private func routeToSomewhere() {
        router?.routeToSomewhere(nil)
    }
}

//Interaction
extension FlightInfoViewController {

    func doSomething() {
		
//		let request = FlightInfo.Model.Request(requestQuery: FlightRequest())
//        interactor?.doSomething(request: request)
  }
}

//Presentation
extension FlightInfoViewController: FlightInfoViewProtocol {
    func displaySomething(viewModel: FlightInfo.Model.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

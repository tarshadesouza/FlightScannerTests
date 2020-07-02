//
//  FlightDetailRouter.swift
//
//  Created by Tarsha De Souza on 02/07/2020.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  This file was generated by the Globile Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FlightDetailRouterProtocol: NSObjectProtocol, FlightDetailRoutingLogicProtocol, FlightDetailDataPassingProtocol {
}

@objc protocol FlightDetailRoutingLogicProtocol {
    func routeToSomewhere(_ segue: UIStoryboardSegue?)
}

protocol FlightDetailDataPassingProtocol {
  var dataStore: FlightDetailDataStoreProtocol? { get }
}

class FlightDetailRouter: NSObject, FlightDetailRouterProtocol {
    
  weak var view: FlightDetailViewProtocol?
  var dataStore: FlightDetailDataStoreProtocol?
  
    init(view: FlightDetailViewProtocol,
         dataStore: FlightDetailDataStoreProtocol?) {
        self.view = view
        self.dataStore = dataStore
    }

    func routeToSomewhere(_ segue: UIStoryboardSegue?) {
//        if let segue = segue, let somewhereViewController = segue.destination as? SomewhereViewController {
//            passDataToNextScene(destination: somewhereViewController)
//        } else if let somewhereViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SomewhereViewControllerViewController") as? SomewhereViewControllerController {
//            passDataToNextScene(destination: somewhereViewController)
//            navigate(to: somewhereViewController)
//        }
    }

    private func navigate(to destination: UIViewController) {
        if let viewController = view as? UIViewController {
            viewController.present(destination, animated: true, completion: nil)
        }
    }

    private func passDataToNextScene(destination: UIViewController?) {
//        if let view = destination as? SomewhereViewController,
//            var somewhereDataStore = view.router?.dataStore,
//            let value = dataStore?.value {
//            somewhereDataStore.value = value
//        }
    }
}

//
//  FlightInfoRouter.swift
//
//  Created by Tarsha de Souza on 1/7/20.
//  Copyright (c) 2020 Tarsha de Souza. All rights reserved.
//
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FlightInfoRouterProtocol: NSObjectProtocol, FlightInfoRoutingLogicProtocol, FlightInfoDataPassingProtocol {
}

@objc protocol FlightInfoRoutingLogicProtocol {
    func routeToSomewhere(_ segue: UIStoryboardSegue?)
}

protocol FlightInfoDataPassingProtocol {
  var dataStore: FlightInfoDataStoreProtocol? { get }
}

class FlightInfoRouter: NSObject, FlightInfoRouterProtocol {
    
  weak var view: FlightInfoViewProtocol?
  var dataStore: FlightInfoDataStoreProtocol?
  
    init(view: FlightInfoViewProtocol,
         dataStore: FlightInfoDataStoreProtocol?) {
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

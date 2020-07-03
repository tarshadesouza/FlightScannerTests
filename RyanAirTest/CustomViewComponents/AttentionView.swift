//
//  AttentionView.swift
//  RyanAirTest
//
//  Created by Tarsha De Souza on 03/07/2020.
//  Copyright © 2020 Tarsha de Souza. All rights reserved.
//

import Foundation
import UIKit

typealias AlertCompletion = (_ action: UIAlertAction, _ alert: UIAlertController) -> Void

protocol AlertPresentable {
    func presentErrorAlert(message: String, acceptCompletion: AlertCompletion?)
    func presentAlert(title: String?, message: String?, acceptTitle: String?, acceptCompletion: AlertCompletion?, cancelTitle: String?, cancelCompletion: AlertCompletion?, style: UIAlertAction.Style?)
}

extension AlertPresentable where Self: UIViewController {
    func presentErrorAlert(message: String, acceptCompletion: AlertCompletion? = nil) {
        _ = presentAlert(message: message, acceptCompletion: acceptCompletion)
    }
    
    func presentAlert(title: String? = nil,
                      message: String? = nil,
                      acceptTitle: String? = nil,
                      acceptCompletion: AlertCompletion? = nil,
                      cancelTitle: String? = nil,
                      cancelCompletion: AlertCompletion? = nil,
					  style: UIAlertAction.Style? = nil) {
		_ = showAlert(title: title,
					  message: message,
					  acceptTitle: acceptTitle,
					  acceptCompletion: acceptCompletion,
					  cancelTitle: cancelTitle,
					  cancelCompletion: cancelCompletion,
					  isDestructive: (style == .destructive))
	}
	
    func showAlert(errorString: String?, completion: AlertCompletion?) {
        showAlert(title: nil, message: errorString, acceptTitle: nil, acceptCompletion: completion, cancelTitle: nil, cancelCompletion: nil)
    }
    
    func showAlert(title: String? = "", message: String?, acceptTitle: String?, acceptCompletion: AlertCompletion? = nil, cancelTitle: String? = nil, cancelCompletion: AlertCompletion? = nil, isDestructive: Bool = false) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let cancel = cancelTitle {
            let cancelAction = UIAlertAction(title: cancel, style: isDestructive ? .destructive : .default, handler: { action in
                if let completion = cancelCompletion {
                    completion(action, alert)
                }
            })
            alert.addAction(cancelAction)
        }
        
        let accept = acceptTitle ?? "Ok"
        let okAction = UIAlertAction(title: accept, style: .default) { action in
            if let completion = acceptCompletion {
                completion(action, alert)
            }
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}

//protocol SpinnerViewAvailable {
//	func showGlobalSpinnerView()
//	func hideGlobalSpinnerView()
//}

//extension SpinnerViewAvailable {
//	func showGlobalSpinnerView() {
//		KRProgressHUD.appearance().style = .white
//		KRProgressHUD.show()
//	}
//
//	func hideGlobalSpinnerView() {
//		KRProgressHUD.dismiss()
//	}
//}
//SpinnerViewAvailable

protocol AttentionView: class, AlertPresentable {
    
}

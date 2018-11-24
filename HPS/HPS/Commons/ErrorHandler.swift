//
//  ErrorHandler.swift
//  HPS
//
//  Created by Jared Perez Vega on 24/11/2018.
//  Copyright © 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

final class ErrorHandler {
    static func showError(error: Error, firstButtonTitle: String = "OK", dismissButtonTitle: String = "Cancel", action: (()->())? = nil, dismissAction: (()->())? = nil) {
        let alertView = UIAlertController()
        let firstButton = UIAlertAction(title: firstButtonTitle, style: .default) { _ in
            action?()
        }
        
        let dismissButton = UIAlertAction(title: dismissButtonTitle, style: .cancel) { _ in
            dismissAction?()
        }
        alertView.title = "HCR Error"
        alertView.message = error.localizedDescription
        alertView.addAction(firstButton)
        alertView.addAction(dismissButton)
        
        guard let currentVC = UIApplication.topViewController() else { return }
        currentVC.present(alertView, animated: true)
    }
    
    static func showAlert(title: String, msg: String, dismissButtonTitle: String = "Cancel", action: (()->())? = nil, dismissAction: (()->())? = nil) {
        let alertView = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let dismissButton = UIAlertAction(title: dismissButtonTitle, style: .cancel) { _ in
            dismissAction?()
        }
        
        alertView.addAction(dismissButton)
        
        guard let currentVC = UIApplication.topViewController() else { return }
        currentVC.present(alertView, animated: true)
    }
}

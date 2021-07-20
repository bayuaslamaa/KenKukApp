//
//  Loader.swift
//  KenKukApp
//
//  Created by Bayu Aslama  on 20/07/21.
//

import UIKit

extension UIViewController {
    
    func showLoader(isWhite: Bool? = nil) {
        let spinnerView = UIView(frame: view.bounds)
        spinnerView.backgroundColor = .white
        spinnerView.tag = 6627
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.center = spinnerView.center
        activityIndicator.startAnimating()
        
        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            self.view.insertSubview(spinnerView, at: 500)
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.view.viewWithTag(6627)?.removeFromSuperview()
        }
    }
}

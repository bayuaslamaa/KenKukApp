//
//  ViewController.swift
//  KenKukApp
//
//  Created by Bayu Aslama  on 18/07/21.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func nextButtonTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "container", bundle: nil).instantiateInitialViewController()!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var nextButton: UIButton!{
        didSet{
            nextButton.layer.cornerRadius = 15
        }
    }
    
}


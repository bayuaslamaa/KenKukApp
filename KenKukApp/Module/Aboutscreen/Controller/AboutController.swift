//
//  AboutController.swift
//  KenKukApp
//
//  Created by Bayu Aslama  on 18/07/21.
//

import UIKit
import SafariServices

class AboutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func githubDidTapped(_ sender: Any) {
        guard let url = URL(string: "https://github.com/bayuaslamaa") else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
}

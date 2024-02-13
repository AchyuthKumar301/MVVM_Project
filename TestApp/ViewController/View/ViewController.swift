//
//  ViewController.swift
//  TestApp
//
//  Created by G Achyuth Kumar on 13/02/24.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCompletionHandler()
        callWebservice()
    }

    private func setupCompletionHandler() {
        viewModel.success = {
            
        }
        viewModel.failure = { msg in
            
        }
    }

    private func callWebservice() {
        viewModel.callWebserviceForFetchingData()
    }
}


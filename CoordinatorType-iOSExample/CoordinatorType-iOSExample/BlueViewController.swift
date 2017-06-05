//
//  ViewController.swift
//  CoordinatorType-iOSExample
//
//  Created by Reid Chatham on 5/31/17.
//  Copyright © 2017 Reid Chatham. All rights reserved.
//

import UIKit
import Architecture

class BlueViewController: UIViewController, ViewModelable {
    
    let viewModel: BlueViewModel
    
    required init(viewModel: BlueViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

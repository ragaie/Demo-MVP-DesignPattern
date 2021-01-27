//
//  ViewController.swift
//  FinishTestLayout
//
//  Created by Ragaie Alfy on 1/27/21.
//

import UIKit

class HomeView: UIViewController {
    var presenter : HomePresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HomePresenter(serviceModel: ServiceManager())
        // Do any additional setup after loading the view.
    }


}


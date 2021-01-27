//
//  HomePresenter.swift
//  FinishTestLayout
//
//  Created by Ragaie Alfy on 1/27/21.
//

import Foundation

class HomePresenter: NSObject,HomePresenterDelegate{
   weak var view: HomeDelegate?
    var service: ServiceManagerDelegate?
    init(serviceModel:ServiceManagerDelegate) {
        self.service = serviceModel
    }
    
    func getData() {
        
    }
    
}

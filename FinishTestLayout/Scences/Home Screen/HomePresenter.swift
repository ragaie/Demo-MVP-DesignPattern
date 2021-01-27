//
//  HomePresenter.swift
//  FinishTestLayout
//
//  Created by Ragaie Alfy on 1/27/21.
//

import Foundation

class HomePresenter: NSObject,HomePresenterDelegate{
    var screenItems: [HomeEntity]?
    
   weak var view: HomeDelegate?
    var service: ServiceManagerDelegate?
    init(serviceModel:ServiceManagerDelegate) {
        self.service = serviceModel
    }
    
    func getData() {
        service?.requestDataWith(way: .GET, endPoint: EndPoints.listData, parameters: [:], classType: [HomeEntity].self, completionHandler: { (object, data, response, error) in
            if let tempData = data {
               // self.cachedManager?.saveDataFor(endPoint: "List", data: tempData)
            }
            if object != nil {
                self.screenItems = object
                self.view?.updateScreenWithData()
            } else if error != nil {
                self.view?.gotAnError(error:  error?.localizedDescription ?? "")
            }
        })
    }
    
}

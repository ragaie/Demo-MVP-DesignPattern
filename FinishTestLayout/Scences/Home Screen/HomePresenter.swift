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
    var cachedManager: CachedData?
    
    init(serviceModel:ServiceManagerDelegate) {
        self.service = serviceModel
        cachedManager = CachedData()
    }
    
    func getData() {
        Internet.start(inComplete: {status in
            if status == .satisfied{
                self.callApi()
            }
            else if status == .unsatisfied{
                self.callCachedData()
            }
        })
    }
    
    func callCachedData(){
        cachedManager?.getDataWith(endPoint: "List", classType: [HomeEntity].self, completionHandler: { (object, data, error) in
            if object != nil {
                self.screenItems = object
                self.view?.updateScreenWithData()
            } else if error != nil {
                self.view?.gotAnError(error:  error?.localizedDescription ?? "")
            }
        })
    }
    
    func callApi(){
        service?.requestDataWith(way: .GET, endPoint: EndPoints.listData, parameters: [:], classType: [HomeEntity].self, completionHandler: { (object, data, response, error) in
            if let tempData = data {
                self.cachedManager?.saveDataFor(endPoint: "List", data: tempData)
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

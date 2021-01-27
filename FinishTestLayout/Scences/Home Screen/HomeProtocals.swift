//
//  HomeProtocals.swift
//  FinishTestLayout
//
//  Created by Ragaie Alfy on 1/27/21.
//

import Foundation
protocol  HomeDelegate: NSObjectProtocol {
    func updateScreenWithData()
    func gotAnError(error: String)
}

protocol  HomePresenterDelegate: NSObjectProtocol {
    var view :HomeDelegate? { get set }
    var screenItems: [HomeEntity]? {get set}

    func getData()
}

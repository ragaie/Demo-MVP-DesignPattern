//
//  HomeEntity.swift
//  FinishTestLayout
//
//  Created by Ragaie Alfy on 1/27/21.
//

import Foundation
struct HomeEntity: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var forks_count: Int?
    var owner: OwnerEntity?
}

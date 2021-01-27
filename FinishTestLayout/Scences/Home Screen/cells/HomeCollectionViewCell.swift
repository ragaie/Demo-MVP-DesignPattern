//
//  HomeCollectionViewCell.swift
//  FinishTestLayout
//
//  Created by Ragaie Alfy on 1/27/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var avatarUrl: UIButton!
    @IBOutlet weak var forkIcon: UIImageView!
    @IBOutlet weak var forkNumber: UILabel!
    var model: HomeEntity?
    
    func setUpData(object: HomeEntity?){
        if let item = object{
            self.model = item
            repoName.text = item.name ?? ""
            repoDescription.text = item.description ?? ""
            forkNumber.text = String(item.forks_count ?? 0)
        
        }
        
    }
}

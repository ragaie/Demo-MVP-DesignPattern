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
            LoadImageWith(url: item.owner?.avatar_url ?? "")
            forkIcon.tintColor = (item.forks_count ?? 0) > 0 ? .green : .white
            avatarUrl.setTitle(item.owner?.avatar_url ?? "", for: .normal)
   
        }
        
    }
    func LoadImageWith(url:String){
        // Create URL
         let url = URL(string: url)!

         DispatchQueue.global().async {
             // Fetch Image Data
             if let data = try? Data(contentsOf: url) {
                 DispatchQueue.main.async {
                     // Create Image and Update Image View
                     self.avatarImage.image = UIImage(data: data)
                 }
             }
         }
    }
 
    @IBAction func openImage(_ sender: Any) {
        if let url = URL(string: model?.owner?.avatar_url ?? "") {
            UIApplication.shared.open(url)
        }    }
}

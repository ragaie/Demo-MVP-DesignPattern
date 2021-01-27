//
//  ViewController.swift
//  FinishTestLayout
//
//  Created by Ragaie Alfy on 1/27/21.
//

import UIKit
//cell id --> homeCellId

class HomeView: UIViewController {
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var presenter : HomePresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
       setUp()
        presenter = HomePresenter(serviceModel: ServiceManager())
        presenter?.view = self
        // Do any additional setup after loading the view.
        presenter?.getData()
    }
    func setUp() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = .zero
        }

        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension HomeView: HomeDelegate{
    func updateScreenWithData() {
        collectionView.reloadData()
        loaderView.isHidden = true
    }
    
    func gotAnError(error: String) {
        
    }
    
 
    
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.screenItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCellId", for: indexPath) as? HomeCollectionViewCell
        cell?.setUpData(object: presenter?.screenItems?[indexPath.row])
        return cell ?? HomeCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       let vvv =  (presenter?.screenItems?[indexPath.row].description as! NSString).size(withAttributes: nil)
     // print(vvv)
      //  var height = (vvv.width / ((collectionView.frame.width / 2) - 10)) * vvv.height
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCellId", for: indexPath) as? HomeCollectionViewCell

        
        let itemSize = presenter?.screenItems?[indexPath.row].description?.size(withAttributes: [
                 NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)
             ])
        let itemSize1 = presenter?.screenItems?[indexPath.row].name?.size(withAttributes: [
                 NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)
             ])
        print(itemSize)
        var height = (itemSize!.width / ((collectionView.frame.width / 2) )) * itemSize!.height
        var height1 = (itemSize1!.width / ((collectionView.frame.width / 2) )) * itemSize1!.height

        var size: CGSize
        size = CGSize.init(width: (collectionView.frame.width / 2) - 10, height: height + height1 + 200)
        return size
    }
}


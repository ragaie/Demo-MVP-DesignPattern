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
        var size: CGSize
        size = CGSize.init(width: (collectionView.frame.width / 2) - 10, height: 300)
        return size
    }
}

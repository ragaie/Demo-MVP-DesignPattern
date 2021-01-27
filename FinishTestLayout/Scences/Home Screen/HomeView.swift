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
    @IBOutlet weak var errorMessage: UILabel!
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
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Repos list"
    }
}

extension HomeView: HomeDelegate{
    func updateScreenWithData() {
        collectionView.isHidden = false
        collectionView.reloadData()
        loaderView.isHidden = true
    }
    
    func gotAnError(error: String) {
        loaderView.isHidden = true
        collectionView.isHidden = true
        errorMessage.text = error
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
        let itemWidth = (collectionView.frame.width / 2) - 10
        let LabelWidth = (collectionView.frame.width / 2) - 30
        let nameHeight = (presenter?.screenItems?[indexPath.row].name ?? "").textHeight(width: LabelWidth, fontSize: 17)
        let descHeight = (presenter?.screenItems?[indexPath.row].description ?? "").textHeight(width: LabelWidth, fontSize: 12)
        size = CGSize.init(width: itemWidth,  height: nameHeight  + descHeight + 200)
        return size
    }
}



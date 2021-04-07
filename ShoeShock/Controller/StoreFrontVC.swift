//
//  StoreFrontVC.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/7/21.
//

import UIKit

class StoreFrontVC: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var discoverCollectionView: UICollectionView!
    @IBOutlet weak var moreCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    func configure() {
        discoverCollectionView.delegate = self
        discoverCollectionView.dataSource = self
//        discoverCollectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
    }

}


extension StoreFrontVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = discoverCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
        
        return cell
    }
    
    
}

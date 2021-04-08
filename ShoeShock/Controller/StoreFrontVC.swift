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
    let shoes = Service.instance.shoes
    let miscItems = Service.instance.miscItems
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    func configure() {
        discoverCollectionView.delegate = self
        discoverCollectionView.dataSource = self
        moreCollectionView.delegate = self
        moreCollectionView.dataSource = self
    }

}


extension StoreFrontVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.discoverCollectionView {
            return shoes.count
        }
        return miscItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.discoverCollectionView {
            let cell = discoverCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.productCell, for: indexPath) as! ProductCell
            let product = shoes[indexPath.row]
            cell.configureCell(with: product)
            return cell
        } else {
            let cell = moreCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.productCell, for: indexPath) as! ProductCell
            let product = miscItems[indexPath.row]
            cell.configureCell(with: product)
            
            print(product.name)
            return cell
        }
        
    }
    
    
}

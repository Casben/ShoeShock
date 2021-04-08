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
    var cart = Service.instance.cartPorducts
    
    var selectedProduct: Product?
    var selectedProductColor: UIColor?
    

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddToCartVC" {
            let addToCartVC = segue.destination as! AddToCartVC
            addToCartVC.selectedProduct = selectedProduct
            addToCartVC.selectedProductColor = selectedProductColor
//            addToCartVC.delegate = self
        }
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
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.discoverCollectionView {
            let selectedCell = collectionView.cellForItem(at: indexPath) as! ProductCell
            selectedProductColor = selectedCell.productBackGround.backgroundColor
            let productDetails = shoes[indexPath.row]
            selectedProduct = Product(name: productDetails.name, price: productDetails.price, image: productDetails.image)
            performSegue(withIdentifier: "toAddToCartVC", sender: self)
        } else {
            let selectedCell = collectionView.cellForItem(at: indexPath) as! ProductCell
            selectedProductColor = selectedCell.productBackGround.backgroundColor
            let productDetails = miscItems[indexPath.row]
            selectedProduct = Product(name: productDetails.name, price: productDetails.price, image: productDetails.image)
            performSegue(withIdentifier: "toAddToCartVC", sender: self)
        }
    }
}

extension StoreFrontVC: AddToCartDelegate {
    func addToCartVC(_ controller: AddToCartVC, wantsToUpdateCartWith product: SelectedProduct) {
        dismiss(animated: true)
        
    }
}


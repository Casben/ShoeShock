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
    @IBOutlet weak var cartButton: UIBarButtonItem!
    @IBOutlet weak var cartQuantityLabel: UIBarButtonItem!
    
    let shoes = Service.instance.shoes
    let miscItems = Service.instance.miscItems
    var cart = Service.instance.cartPorducts
    
    var selectedProduct: Product?
    var selectedProductColor: UIColor?
    var cartQuantity = 0
    

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    //MARK: - Helpers
    
    func configure() {
        discoverCollectionView.delegate = self
        discoverCollectionView.dataSource = self
        moreCollectionView.delegate = self
        moreCollectionView.dataSource = self
        cartButton.isEnabled = false
    }
    
    func resetStoreFront() {
        cartQuantityLabel.title = "0"
        cartQuantity = 0
        cartButton.image = UIImage(systemName: "cart")
        cartButton.isEnabled = false
        cart.removeAll()
    }
    
    func presentPurchaseCompleteAlert() {
        let alert = UIAlertController(title: "Purchase Complete", message: "Enjoy your items!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Thanks!", style: .default))
        present(alert, animated: true)
    }
    
    func updateCart(with product: SelectedProduct) {
        cart.append(product)
        print(cart)
        cartButton.image = UIImage(systemName: "cart.fill")
        cartQuantity += product.quantity
        cartQuantityLabel.title = String(cartQuantity)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddToCartVC" {
            let addToCartVC = segue.destination as! AddToCartVC
            addToCartVC.selectedProduct = selectedProduct
            addToCartVC.delegate = self
        } else {
            let cartVC = segue.destination as! CartVC
            cartVC.delegate = self
            cartVC.cart = cart
        }
    }
    @IBAction func cartButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toCartVC", sender: self)
    }
    
}

//MARK: - UICollectionViewDataSource & UICollectionViewDelegate

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
            cell.delegate = self
            return cell
        } else {
            let cell = moreCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.productCell, for: indexPath) as! ProductCell
            let product = miscItems[indexPath.row]
            cell.configureCell(with: product)
            cell.delegate = self
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

//MARK: - AddToCartDelegate

extension StoreFrontVC: AddToCartDelegate {
    func addToCartDelegate(wantsToUpdateCartWith product: SelectedProduct) {
        dismiss(animated: true)
        cartButton.isEnabled = true
        updateCart(with: product)
    }
}

//MARK: - ProductCellDelegate

extension StoreFrontVC: ProductCellDelegate {
    func productCell(wantsToAddToCart product: SelectedProduct) {
        cartButton.isEnabled = true
        updateCart(with: product)
    }
}

//MARK: - CartVCDelegate

extension StoreFrontVC: CartVCDelegate {
    func completePurchase() {
        resetStoreFront()
        dismiss(animated: true)
        presentPurchaseCompleteAlert()
    }
    
    func cartVCwantsToBeDismissed() {
        resetStoreFront()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.dismiss(animated: true)
        }
        
    }
}

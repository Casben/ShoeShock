//
//  AddToCartVC.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/8/21.
//

import UIKit

protocol AddToCartDelegate: class {
    func addToCartDelegate(wantsToUpdateCartWith product: SelectedProduct)
}

class AddToCartVC: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cartStepper: UIStepper!
    @IBOutlet weak var addToCartButton: PurchaseButton!
    
    var selectedProduct: Product!
    var selectedProductColor: UIColor!
    weak var delegate: AddToCartDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    func configure() {
        cardView.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.94)
        cardView.layer.cornerRadius = 10
        productImageView.image = selectedProduct.image
        productImageView.layer.cornerRadius = 10
        productImageView.layer.borderColor = UIColor.systemBackground.cgColor
        productNameLabel.text = selectedProduct.name
        priceLabel.text = String(selectedProduct.price)
        addToCartButton.configureButtonTitle(withText: "Add to cart")
    }
    
    

    @IBAction func stepperTapped(_ sender: UIStepper) {
        let quantityValue = Int(sender.value)
        let updatedPrice = selectedProduct.price * quantityValue
        quantityLabel.text = String(quantityValue)
        priceLabel.text = String(updatedPrice)
    }
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {
        let quantity = Int(quantityLabel.text!)!
        let price = Int(priceLabel.text!)!
        let cartProduct = SelectedProduct(product: selectedProduct, quantity: quantity, price: price)
        delegate?.addToCartDelegate(wantsToUpdateCartWith: cartProduct)
    }
}

//
//  AddToCartVC.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/8/21.
//

import UIKit

protocol AddToCartDelegate: class {
    func addToCartVC(_ controller: AddToCartVC, wantsToUpdateCartWith product: SelectedProduct)
}

class AddToCartVC: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cartStepper: UIStepper!
    @IBOutlet weak var addToCartButton: UIButton!
    
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
        priceLabel.text = "$\(selectedProduct.price)"
        configureButton()
        
    }
    
    func configureButton() {
        addToCartButton.layer.cornerRadius = 10
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "cart")?.withRenderingMode(.alwaysTemplate)
        imageAttachment.image?.withTintColor((addToCartButton.titleLabel?.textColor)!)
        let attirbutedText = NSMutableAttributedString(string: "Add to cart ")
        attirbutedText.append(NSAttributedString(attachment: imageAttachment))
        addToCartButton.setAttributedTitle(attirbutedText, for: .normal)
    }

    @IBAction func stepperTapped(_ sender: UIStepper) {
        let quantityValue = Int(sender.value)
        let updatedPrice = selectedProduct.price * quantityValue
        quantityLabel.text = String(quantityValue)
        priceLabel.text = "$\(updatedPrice)"
        
    }
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {
        let quantity = Int(quantityLabel.text!)!
        let cartProduct = SelectedProduct(product: selectedProduct, quantity: quantity)
        delegate?.addToCartVC(self, wantsToUpdateCartWith: cartProduct)
    }
}

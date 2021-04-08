//
//  AddToCartVC.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/8/21.
//

import UIKit

class AddToCartVC: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var cartStepper: UIStepper!
    @IBOutlet weak var addToCartButton: UIButton!
    
    var selectedProduct: Product!
    var selectedProductColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    func configure() {
        cardView.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.96)
        productImageView.layer.cornerRadius = 10
        productImageView.layer.borderColor = UIColor.systemBackground.cgColor
        addToCartButton.layer.cornerRadius = 10
        addToCartButton.setTitle("Add to cart \(UIImage(systemName: "cart")!)", for: .normal)
    }

}

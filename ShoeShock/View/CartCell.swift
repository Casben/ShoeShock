//
//  CartCell.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/8/21.
//

import UIKit

class CartCell: UITableViewCell {
    
    static let identifier = "CartCell"
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cartStepper: UIStepper!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        productImage.layer.cornerRadius = 10
    }
    
    func configureCell(with item: SelectedProduct) {
        productImage.image = item.product.image
        productNameLabel.text = item.product.name
        quantityLabel.text = String(item.quantity)
        priceLabel.text = String(item.price)
    }

}

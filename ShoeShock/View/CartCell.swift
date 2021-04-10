//
//  CartCell.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/8/21.
//

import UIKit

protocol CartCellDelegate: class {
    func cartCell(wantsToUpdateTotalPriceAdd price: Int)
    func cartCell(_ cartCell: CartCell, wantsToUpdateTotalPriceSubtract price: Int)
}

class CartCell: UITableViewCell {
    
    static let identifier = "CartCell"
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var price: Int!
    final var pricePerItem: Int!
    var quantity: Int!
    
    var delegate: CartCellDelegate?

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
        quantity = Int(item.quantity)
        price = Int(item.price)
        pricePerItem = price / quantity
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        quantity += 1
        let updatedPrice = pricePerItem * quantity
        priceLabel.text = String(updatedPrice)
        quantityLabel.text = String(quantity)
        price = updatedPrice
        delegate?.cartCell(wantsToUpdateTotalPriceAdd: pricePerItem)
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        quantity -= 1
        let updatedPrice =  (pricePerItem * quantity)
        print(updatedPrice)
        priceLabel.text = String(updatedPrice)
        quantityLabel.text = String(quantity)
        price = updatedPrice
        delegate?.cartCell(self, wantsToUpdateTotalPriceSubtract: pricePerItem)
    }

}

//
//  ProductCell.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/7/21.
//

import UIKit

protocol ProductCellDelegate: class {
    func productCell(wantsToAddToCart product: SelectedProduct)
}

class ProductCell: UICollectionViewCell {
    
    static let productCell = "ProductCell"
    
    
    @IBOutlet weak var productBackGround: UIView!
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    weak var delegate: ProductCellDelegate?
    var product: SelectedProduct!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        heartButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
    }

    
    private func configure() {
        productBackGround.layer.cornerRadius = 10
        productView.layer.cornerRadius = 10
        shoeImageView.layer.cornerRadius = 10
    }
    
    func configureCell(with product: Product) {
        self.product = SelectedProduct(product: product, quantity: 1, price: 0)
        productBackGround.backgroundColor = .randomColor()
        
        productNameLabel.text = product.name
        productNameLabel.textColor = .systemGray
        
        priceLabel.text = "$\(product.price)"
        priceLabel.textColor = .systemGray2
        
        shoeImageView.image = product.image
        shoeImageView.layer.borderWidth = 4.0
        shoeImageView.layer.borderColor = UIColor.systemBackground.cgColor
        
        
    }
    
    func getComplementaryColorFor(_ color: UIColor) -> UIColor {
        let ciColor = CIColor(color: color)
        
        let compRed: CGFloat = 2.0 - ciColor.red
        let compGreen: CGFloat = 2.0 - ciColor.green
        let compBlue: CGFloat = 2.0 - ciColor.blue
        
        return UIColor(red: compRed, green: compGreen, blue: compBlue, alpha: 1.0)

    }
    
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        sender.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        delegate?.productCell(wantsToAddToCart: product)
    }
}

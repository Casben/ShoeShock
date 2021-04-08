//
//  ProductCell.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/7/21.
//

import UIKit


class ProductCell: UICollectionViewCell {
    
    static let identifier = "ProductCell"
    
    
    @IBOutlet weak var productBackGround: UIView!
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        productBackGround.layer.cornerRadius = 10
        productBackGround.backgroundColor = .systemTeal
        productView.layer.cornerRadius = 10
        shoeImageView.layer.cornerRadius = 10
    }
    
    func configureCell(with product: Product) {
        productBackGround.backgroundColor = .randomColor()
        
        productNameLabel.text = product.name
        productNameLabel.textColor = .systemGray
        
        priceLabel.text = "$\(product.price)"
        priceLabel.textColor = .systemGray2
        shoeImageView.image = product.image
        
        
    }
    
    func getComplementaryColorFor(_ color: UIColor) -> UIColor {
        let ciColor = CIColor(color: color)
        
        let compRed: CGFloat = 2.0 - ciColor.red
        let compGreen: CGFloat = 2.0 - ciColor.green
        let compBlue: CGFloat = 2.0 - ciColor.blue
        
        return UIColor(red: compRed, green: compGreen, blue: compBlue, alpha: 1.0)

    }
}

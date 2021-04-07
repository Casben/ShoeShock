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
    @IBOutlet weak var shoeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure() {
        productBackGround.layer.cornerRadius = 10
        productBackGround.backgroundColor = .systemTeal
        productView.layer.cornerRadius = 10
        shoeImage.layer.cornerRadius = 10
    }
}

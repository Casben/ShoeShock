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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure() {
        productBackGround.layer.cornerRadius = 10
        productBackGround.backgroundColor = .systemIndigo
        productView.layer.cornerRadius = 10
    }
}

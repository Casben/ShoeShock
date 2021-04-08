//
//  Product.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/7/21.
//

import UIKit

struct Product {
    var name: String
    var price: Int
    let image: UIImage
}

struct SelectedProduct {
    var product: Product
    var quantity = 0
    var price = 0
}


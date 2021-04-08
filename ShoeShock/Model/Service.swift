//
//  Service.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/7/21.
//

import UIKit


class Service {
    
    static let instance = Service()
    
    var shoes = [
        Product(name: "ULTRA4D", price: 220, image: ProductImage.ultra4d),
        Product(name: "NMD_R1 V2", price: 140, image: ProductImage.nmd_r1),
        Product(name: "KAPTIR 2.0", price: 85, image: ProductImage.kaptir2),
        Product(name: "ULTRABOOST 5.0 DNA", price: 85, image: ProductImage.ultraboost),
        Product(name: "ZX FURY", price: 200, image: ProductImage.zxfury),
        Product(name: "ZK 2K BOOST", price: 150, image: ProductImage.zkboost),
        Product(name: "KAPTIR SUPER", price: 90, image: ProductImage.kaptirsuper),
        Product(name: "PHARRELL WILLIAMS ZX 2K", price: 140, image: ProductImage.pharrell),
    ]
    
    
    
    enum ProductImage {
        static let ultra4d = UIImage(named: "ULTRA4D")!
        static let nmd_r1 = UIImage(named: "NMD_R1V2")!
        static let kaptir2 = UIImage(named: "KAPTIR2.0")!
        static let ultraboost = UIImage(named: "ULTRABOOST5.0DNA")!
        static let zxfury = UIImage(named: "ZXFURY")!
        static let zkboost = UIImage(named: "ZK2BOOST")!
        static let kaptirsuper = UIImage(named: "KAPTIRSUPER")!
        static let pharrell = UIImage(named: "PHARRELLWILLIAMSZX2K")!
    }
}



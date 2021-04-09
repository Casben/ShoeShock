//
//  PurchaseButton.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/8/21.
//

import UIKit

class PurchaseButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        
    }
    
    func configureButtonTitle(withText text: String) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "cart")?.withRenderingMode(.alwaysTemplate)
        imageAttachment.image?.withTintColor((titleLabel?.textColor)!)
        let attirbutedText = NSMutableAttributedString(string: text + " ")
        attirbutedText.append(NSAttributedString(attachment: imageAttachment))
        setAttributedTitle(attirbutedText, for: .normal)
    }
}

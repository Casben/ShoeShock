//
//  CartVC.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/8/21.
//

import UIKit

protocol CartVCDelegate: class {
    func cartVCwantsToBeDismissed()
    func completePurchase()
}

class CartVC: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var purchaseButton: PurchaseButton!
    
    weak var delegate: CartVCDelegate?
    
    var cart = Service.instance.cartPorducts
    var totalPrice: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    

    func configure() {
        cartTableView.dataSource = self
        cartTableView.delegate = self
        cartTableView.allowsSelection = false
        purchaseButton.configureButtonTitle(withText: "Purchase")
        calculateTotalCost()
    }
    
    func calculateTotalCost() {
        for itemPrice in cart {
            totalPrice += itemPrice.price
        }
        totalLabel.text = String(totalPrice)
    }
    
    @IBAction func purchaseButtonTapped(_ sender: UIButton) {
        delegate?.completePurchase()
    }
}

extension CartVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: CartCell.identifier, for: indexPath) as! CartCell
        let cartItem = cart[indexPath.row]
        cell.configureCell(with: cartItem)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

extension CartVC: CartCellDelegate {
    func cartCell(wantsToUpdateTotalPriceAdd price: Int) {
        totalPrice += price
        totalLabel.text = String(totalPrice)
    }
    
    func cartCell(_ cartCell: CartCell, wantsToUpdateTotalPriceSubtract price: Int) {
        totalPrice -= price
        totalLabel.text = String(totalPrice)
        if cartCell.price == 0 {
            guard let cellIndex = cartTableView.indexPath(for: cartCell) else { return }
            cart.remove(at: cellIndex.row)
            cartTableView.deleteRows(at: [cellIndex], with: .automatic)
            if cart.count == 0 {
                delegate?.cartVCwantsToBeDismissed()
            }
        }
    }
}

//
//  CartVC.swift
//  ShoeShock
//
//  Created by Herbert Dodge on 4/8/21.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var purchaseButton: PurchaseButton!
    
    var cart = Service.instance.cartPorducts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        print(cart)
    }
    

    func configure() {
        cartTableView.dataSource = self
        cartTableView.delegate = self
        cartTableView.allowsSelection = false
        purchaseButton.configureButtonTitle(withText: "Purchase")
        
    }
    
    @IBAction func purchaseButtonTapped(_ sender: UIButton) {
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

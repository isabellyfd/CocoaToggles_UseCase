//
//  ViewController.swift
//  UseCase
//
//  Created by Isabelly Damascena on 24/10/19.
//  Copyright © 2019 Isabelly Damascena. All rights reserved.
//

import UIKit
import CocoaToggles

class ViewController: UIViewController {
    
    @IBOutlet weak var currencyTextfield: UITextField!
    
    private var discountService = DiscountService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupToggleManager()
    }
    
    private func setupToggleManager() {
        let appConfiguration = CTConfiguration("", "")
        let toggleManager = CTToggleManager(configuration: appConfiguration)
        toggleManager.delegate = self
        toggleManager.config()
    }

    @IBAction func onClickToPayButton(_ sender: Any) {
        guard let unformattedAmount = currencyTextfield.text else { return }
        guard let amount = Double(unformattedAmount) else { return }
        
        let discount = self.discountService.calculateDiscount(for: Decimal(amount))
        
        self.showAlert(amount: unformattedAmount, discount: discount)
    }

    private func showAlert(amount: String, discount: Decimal) {
        let alert = UIAlertController(title: "Cashback!!", message: "Ao pagar R$\(amount) reais você receberá R$\(discount) reais de cashbak!", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
}

extension ViewController : CTTogglesDelegate {
    
    func getTogglesFrom(repository: CTRepository) {
        
    }
}

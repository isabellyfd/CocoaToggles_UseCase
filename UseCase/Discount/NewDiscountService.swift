//
//  NewDiscountService.swift
//  UseCase
//
//  Created by Isabelly Damascena on 28/10/19.
//  Copyright © 2019 Isabelly Damascena. All rights reserved.
//

import Foundation

class NewDiscountService : Discountable {
    private let percentage = Decimal(floatLiteral: 0.05)
    
    func calculateDiscount(for amount: Decimal) -> Decimal {
        return amount * percentage
    }
}

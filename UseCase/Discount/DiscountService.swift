//
//  DiscountService.swift
//  UseCase
//
//  Created by Isabelly Damascena on 24/10/19.
//  Copyright © 2019 Isabelly Damascena. All rights reserved.
//

import Foundation

class DiscountService : Discountable {
    
    private let percentage = Double(floatLiteral: 0.1)

    func calculateDiscount(for amount: Double) -> Double {
        return amount * percentage
    }
}

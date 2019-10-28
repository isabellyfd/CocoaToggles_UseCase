//
//  Discountable.swift
//  UseCase
//
//  Created by Isabelly Damascena on 28/10/19.
//  Copyright © 2019 Isabelly Damascena. All rights reserved.
//

import Foundation

protocol Discountable {
    
    func calculateDiscount(for amount: Decimal) -> Decimal
}

//
//  DoubleExtension.swift
//  UseCase
//
//  Created by Isabelly Damascena on 28/10/19.
//  Copyright © 2019 Isabelly Damascena. All rights reserved.
//

import Foundation

extension Double {
    func format(with format: String) -> String {
        return String(format: "%\(format)f", self)
    }
}

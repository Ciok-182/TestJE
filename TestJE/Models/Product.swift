//
//  Product.swift
//  TestJE
//
//  Created by Jorge Encinas on 27/12/23.
//

import UIKit

public class Product: Codable {
    var name: String = ""
    var price: Double = 0
    
    public init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

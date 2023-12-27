//
//  Interactor.swift
//  TestJE
//
//  Created by Jorge Encinas on 27/12/23.
//

import UIKit

protocol InteractorDelegate {
    func doneGetProducts(success: Bool, description: String, products: [Product])
}

class Interactor: NSObject {
    
    var delegate: InteractorDelegate?
    
    func getProducts() {
        print("getting products")
        guard let url = URL(string: "https://source.com/api/products") else {
            delegate?.doneGetProducts(success: false, description: "Connection fail", products: [])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.delegate?.doneGetProducts(success: false, description: "Without data", products: [])
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                self.delegate?.doneGetProducts(success: true, description: "OK", products: products)
            } catch {
                self.delegate?.doneGetProducts(success: false, description: "Error decoding JSON: \(error)", products: [])
            }
        }.resume()
    }
}

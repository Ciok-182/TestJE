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
        
        Manager.loadProductsFromCoreData { [weak self] coreDataProducts in
            if let coreDataProducts = coreDataProducts, !coreDataProducts.isEmpty {
                self?.delegate?.doneGetProducts(success: false, description: "Data loaded successfully from Core Data", products: coreDataProducts)
            } else {
                print("getting products API")
                guard let url = URL(string: "https://source.com/api/products") else {
                    self?.delegate?.doneGetProducts(success: false, description: "Connection fail", products: [])
                    return
                }
                
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else {
                        self?.delegate?.doneGetProducts(success: false, description: "Without data", products: [])
                        return
                    }
                    
                    do {
                        let products = try JSONDecoder().decode([Product].self, from: data)
                        
                        //let myTestPruducts = [Product(name: "Producto 1", price: 10.67), Product(name: "Producto 2", price: 99.78),  Product(name: "Producto 3", price: 120.84)]
                        
                        Manager.saveProductsToCoreData(products)
                        self?.delegate?.doneGetProducts(success: true, description: "OK", products: products)
                    } catch {
                        self?.delegate?.doneGetProducts(success: false, description: "Error decoding JSON: \(error)", products: [])
                    }
                }.resume()
            }
        }
        
        
        
        
        
        
        
    }
}

//
//  Manager.swift
//  TestJE
//
//  Created by Jorge Encinas on 27/12/23.
//

import CoreData
import UIKit

class Manager {
    static let shared = Manager()
    private init() {}
    
    static func saveProductsToCoreData(_ products: [Product]) {
        print("saveProductsToCoreData")
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        for product in products {
            let productEntity = NSEntityDescription.insertNewObject(forEntityName: "ProductDTO", into: context) as! ProductDTO
            productEntity.name = product.name
            productEntity.price = product.price
        }
        
        do {
            try context.save()
        } catch {
            print("Fail to save data in Core Data: \(error)")
        }
    }
    
    static func loadProductsFromCoreData(completion: @escaping ([Product]?) -> Void) {
        print("loadProductsFromCoreData")
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            completion(nil)
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ProductDTO>(entityName: "ProductDTO")
        
        do {
            let productEntities = try context.fetch(fetchRequest)
            let products = productEntities.map { Product(name: $0.name ?? "", price: $0.price) }
            completion(products)
        } catch {
            print("Failed to fetch data from Core Data: \(error)")
            completion(nil)
        }
    }
}

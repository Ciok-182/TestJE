//
//  ProductDTO+CoreDataProperties.swift
//  TestJE
//
//  Created by Jorge Encinas on 27/12/23.
//
//

import Foundation
import CoreData


extension ProductDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductDTO> {
        return NSFetchRequest<ProductDTO>(entityName: "ProductDTO")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Double

}

extension ProductDTO : Identifiable {

}

//
//  ViewController.swift
//  TestJE
//
//  Created by Jorge Encinas on 27/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblProducts: UITableView!
    private var allProducts = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        task1()
        tblProducts.delegate = self
        tblProducts.dataSource = self
        getProducts()
    }

    // MARK: - Sum Even
    private func task1(){
        let array = [1,2,3,4,5,6,7,8,9,10,11,12]
        let result = ViewController.sumEven(array)
        print("Result: \(result)")
    }

    static func sumEven(_ myNumbers: [Int]) -> Int {
        var result = 0
        if myNumbers.count > 0 {
            for number in myNumbers {
                if number % 2 == 0 {
                    result = result + number
                }
            }
            return result
        } else { return 0 }
    }

    // MARK: - Get Products
    private func getProducts(){
        let interactor = Interactor()
        interactor.delegate = self
        interactor.getProducts()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        let data = self.allProducts[indexPath.row]
        cell.configureView(data: data)
        cell.selectionStyle = .none
        return cell
    }
}


extension ViewController: InteractorDelegate {
    
    func doneGetProducts(success: Bool, description: String, products: [Product]) { 
        if success { 
            print("OK Description: \(description)")
            allProducts = products
            DispatchQueue.main.async {
                self.tblProducts.reloadData()
            }
        } else {
            print("Error getting data! showing test data")
            let myTestPruducts = [Product(name: "Producto 1", price: 10.67), Product(name: "Producto 2", price: 99.78),  Product(name: "Producto 3", price: 120.84)]
            allProducts = myTestPruducts
            DispatchQueue.main.async {
                self.tblProducts.reloadData()
            }
            
        }
    }
    
}

//
//  ViewController.swift
//  TestJE
//
//  Created by Siok on 27/12/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let array = [1,2,3,4,5,6,7,8,9,10,11,12]
        let result = ViewController.sumEven(array)
        print("Result: \(result)")
        // Do any additional setup after loading the view.
    }

    // MARK: - Sum Even
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

}


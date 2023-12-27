//
//  TestJETests.swift
//  TestJETests
//
//  Created by Siok on 27/12/23.
//

import XCTest
@testable import TestJE

final class TestJETests: XCTestCase {
    
    func testSumEven() {
        
        let example = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
        let example2 = [2, 4, 6, 8, 10, 12]
        let example3 = [1, 3, 5, 7, 9, 11]
        let exampleEmpty: [Int] = []
        
        let result1 = ViewController.sumEven(example)
        let result2 = ViewController.sumEven(example2)
        let result3 = ViewController.sumEven(example3)
        let result4 = ViewController.sumEven(exampleEmpty)
        
        // Assert
        XCTAssertEqual(result1, 42, "Sum of even of \(example) should be 42")
        XCTAssertEqual(result2, 42, "Sum of even of \(example2) should be 42")
        XCTAssertEqual(result3, 0, "Sum of even of \(exampleEmpty) should be 0")
        XCTAssertEqual(result4, 0, "Sum of even of an empty array should be 0")
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

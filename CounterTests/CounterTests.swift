//
//  CounterTests.swift
//  CounterTests
//
//  Created by Daniel Sadka on 02.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import XCTest
import UIKit
@testable import Counter

class CounterTests: XCTestCase {
    
    var sut: FirstViewController!
    
    override func setUp() {
        super.setUp()
        let window = UIWindow()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "FirstView") as! FirstViewController
        _ = sut.view
        
        //add TestViewController to view hierarchy
        window.addSubview(sut.view)
    }
    
    func testDataHandlerCheckDecimals(){
        XCTAssertFalse(sut.dataHandler.checkDecimals(), "DataHandler.CheckDecimals() should return false if decimal attribute is other then 10")
    }
    
    func testDataHandlerCheckDecimalsWhenDecimalsEqualTo10(){
        sut.dataHandler.decimals = 10
        XCTAssertTrue(sut.dataHandler.checkDecimals(), "DataHandler.CheckDecimals() should return true if decimal attribute is 10")
        XCTAssertTrue(sut.dataHandler.decimals == 0 , "DataHandler.decimals should be 0 after 10 when function DataHandler.CheckDecimals() was used")
    }
    
    func testDataHandlerCheckUnits(){
        XCTAssertFalse(sut.dataHandler.checkUnits(), "DataHandler.CheckUnits() should return false if units attribute is other then 10")
    }

    func testDataHandlerCheckUnitsWhenUnitsEqualTo10(){
        sut.dataHandler.units = 10
        XCTAssertTrue(sut.dataHandler.checkUnits(), "DataHandler.CheckUnits() should return true if decimal attribute is 10")
        XCTAssertTrue(sut.dataHandler.units == 0 , "DataHandler.units should be 0 after 10 when function DataHandler.CheckDecimals() was used")
    }
    
    func testDataHandlerCheckIfFirstTen(){
        sut.dataHandler.reset()
        sut.dataHandler.counter += 1
        XCTAssertTrue(sut.dataHandler.checkIfFirstTen(),"Function dataHandler.checkIfFirstTen() must return true if counter is lower then 10 and decimal attribute is 0")
        sut.dataHandler.counter = 20
        XCTAssertFalse(sut.dataHandler.checkIfFirstTen(),"Function dataHandler.checkIfFirstTen() must return false if counter is higher then 10 and decimal attribute is 0")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

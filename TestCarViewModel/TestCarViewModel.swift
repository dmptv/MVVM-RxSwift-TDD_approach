//
//  TestCarViewModel.swift
//  TestCarViewModel
//
//  Created by 123 on 13.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa

@testable import MVVM_practical

class TestCarViewModel: XCTestCase {
    
    override func setUp() {
        super.setUp()
       
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testCarViewModelWithFerrariF12() {
        let ferrariF12 = Car(model: "F12", make: "Ferrari", kilowatts: 544, photoURL: "http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
        let ferrariViewModel = CarViewModel(car: ferrariF12)
        
        XCTAssertEqual(try! ferrariViewModel.modelText.value(), "F12")
        XCTAssertEqual(try! ferrariViewModel.makeText.value(), "Ferrari")
        XCTAssertEqual(try! ferrariViewModel.horsepowerText.value(), "730 HP")
        XCTAssertEqual(ferrariViewModel.photoURL, URL(string: ferrariF12.photoURL))
        XCTAssertEqual(try! ferrariViewModel.titleText.value(), "Ferrari F12")
    }
   
    func testAdjustingKilowattsAdjustsHorsepower() {
        let someCar = Car(model: "Random", make: "Car", kilowatts: 100, photoURL: "http://candycode.io")
        let someCarViewModel = CarViewModel(car: someCar)
        
        XCTAssertEqual(try! someCarViewModel.horsepowerText.value(), "134 HP")
        
        someCarViewModel.kilowattText.onNext("200")
        XCTAssertEqual(try! someCarViewModel.horsepowerText.value(), "268 HP")
        
        // Minimum power is 0
        someCarViewModel.kilowattText.onNext("-20")
        XCTAssertEqual(try! someCarViewModel.horsepowerText.value(), "0 HP")
    }

    
}















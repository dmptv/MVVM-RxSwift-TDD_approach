//
//  CarViewModel.swift
//  MVVM-practical
//
//  Created by 123 on 13.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CarViewModel {
    private var car: Car
    
    static let horsepowerPerKilowatt = 1.34102209
    
    let disposeBag = DisposeBag()

    var modelText: BehaviorSubject<String>
    var makeText: BehaviorSubject<String>
    var horsepowerText: BehaviorSubject<String>
    var kilowattText: BehaviorSubject<String>
    var titleText: BehaviorSubject<String>

    var photoURL: URL? {
        return URL(string: car.photoURL)
    }
    
    init(car: Car) {
        self.car = car
        
        // initialized with the current value and registering for changes
        // so the car variable updates respectively
        modelText = BehaviorSubject<String>(value: car.model)
        modelText.subscribe(onNext: { model in
            car.model = model
        })
        .disposed(by: disposeBag)
        
        makeText = BehaviorSubject<String>(value: car.make)
        makeText.subscribe(onNext: { make in
            car.make = make
        })
        .disposed(by: disposeBag)
        
        // It uses the combineLatest function to combine whatever changes
        // the makeText and titleText receive, combine them into one string
        // and assign them to titleText
        titleText = BehaviorSubject<String>(value: "\(car.make) \(car.model)")
        Observable.combineLatest(makeText.asObservable(), modelText.asObservable()) {
            return $0 + " " + $1
        }.bind(to: titleText).disposed(by: disposeBag)

        // parse a number from whatever string the kilowattText subject holds
        // and binds the calculated and decorated horsepower string to horsepowerText
        horsepowerText = BehaviorSubject(value: "0")
        kilowattText = BehaviorSubject(value: String(car.kilowatts))
        kilowattText.map { kilowatts -> String in
            let kw = Int(kilowatts) ?? 0
            let horsepower = max(Int(round(Double(kw) * CarViewModel.horsepowerPerKilowatt)), 0)
            return "\(horsepower) HP"
        }.bind(to: horsepowerText).disposed(by: disposeBag)
        
    }

}


























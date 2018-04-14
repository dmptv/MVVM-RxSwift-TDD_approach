//
//  AppDelegate.swift
//  MVVM-practical
//
//  Created by 123 on 13.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let cars: [CarViewModel] = {
        let ferrariF12 = Car(model: "F12", make: "Ferrari", kilowatts: 544, photoURL: "http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
        let zondaF = Car(model: "Zonda F", make: "Pagani", kilowatts: 449, photoURL: "http://storage.pagani.com/view/1024/BIG_zg-4-def.jpg")
        let lamboAventador = Car(model: "Aventador", make: "Lamborghini", kilowatts: 522, photoURL: "http://cdn.lamborghini.com/content/models/aventador_lp700-4_roadster/gallery_2013/roadster_21.jpg")
        
        return [CarViewModel(car: ferrariF12), CarViewModel(car: zondaF), CarViewModel(car: lamboAventador)]
    }()
    
    // for tests
    let ferrariF12 = Car(model: "F12", make: "Ferrari", kilowatts: 544, photoURL: "http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
        
        return true
    }



}












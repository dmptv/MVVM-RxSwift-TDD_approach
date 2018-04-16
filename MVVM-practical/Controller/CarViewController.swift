//
//  CarViewController.swift
//  MVVM-practical
//
//  Created by 123 on 14.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CarViewController: UIViewController {
    
    @IBOutlet weak var makeField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var kilowattField: UITextField!
    
    var carViewModel: CarViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let carViewModel = carViewModel else { return }
        
        bindViewmodelToTextfield(carViewModel)
        bindInputsFromTextfieldsToViewmodel(carViewModel)
        subdcribeForTitle(carViewModel)
    }
    
    // Private (bind view model)
    
    private func bindViewmodelToTextfield(_ carViewModel: CarViewModel) {
        // Assigning carViewModel's properties to our three text fields
        carViewModel.makeText.bind(to: makeField.rx.text).disposed(by: disposeBag)
        carViewModel.modelText.bind(to: modelField.rx.text).disposed(by: disposeBag)
        carViewModel.kilowattText.bind(to: kilowattField.rx.text).disposed(by: disposeBag)
    }
    
    private func subdcribeForTitle(_ carViewModel: CarViewModel) {
        // Assigning the titleText to our View Controller title
        carViewModel.titleText.subscribe(onNext: { title in
            self.navigationItem.title = title
        }).disposed(by: disposeBag)
    }
    
    // (bind ui elements)
    
    private func bindInputsFromTextfieldsToViewmodel(_ carViewModel: CarViewModel) {
        // Binding whatever the input is in our three text fields to our carViewModel's properties
        //  Adding orEmpty you transform your String? control property into control property of type String
        let controlPropertyMake = makeField.rx.text
        controlPropertyMake
            .orEmpty
            .bind(to: carViewModel.makeText)
            .disposed(by: disposeBag)
        
        let controlPropertyModel = modelField.rx.text
        controlPropertyModel
            .orEmpty
            .bind(to: carViewModel.modelText)
            .disposed(by: disposeBag)
        
        let controlPropertykilowatt = kilowattField.rx.text
        controlPropertykilowatt
            .orEmpty
            .filter { string -> Bool in
                // Validate we are only passing integer or empty strings (which result in 0 HP)
                // if true then it passes further
                return Int(string) != nil || string.isEmpty
            }
            .bind(to: carViewModel.kilowattText)
            .disposed(by: disposeBag)
    }
}













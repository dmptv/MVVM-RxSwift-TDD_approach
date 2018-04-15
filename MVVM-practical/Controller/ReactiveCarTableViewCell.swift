//
//  CarTableViewCell.swift
//  MVVM-practical
//
//  Created by 123 on 13.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class CarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carPhotoView: UIImageView!
    @IBOutlet weak var carTitleLabel: UILabel!
    @IBOutlet weak var carPowerLAbel: UILabel!
    
    let disposeBag = DisposeBag()
    
    var carViewModel: CarViewModel? {
        didSet {
            guard let carViewModel = carViewModel else { return }
            
            carViewModel.titleText.bind(to: carTitleLabel.rx.text).disposed(by: disposeBag)
            carViewModel.horsepowerText.bind(to: carPowerLAbel.rx.text).disposed(by: disposeBag)
            
            guard let photoURL = carViewModel.photoURL else { return }
            URLSession.shared.rx.data(request: URLRequest(url: photoURL))
                .subscribe(onNext:  { data in
                    DispatchQueue.main.async {
                        self.carPhotoView.image = UIImage(data: data)
                        self.carPhotoView.setNeedsLayout()
                    }
                }, onError: { error in
                    print("error occurs", error.localizedDescription)
            })
            .disposed(by: disposeBag)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
      
        carPhotoView.translatesAutoresizingMaskIntoConstraints = true
    }

  

}








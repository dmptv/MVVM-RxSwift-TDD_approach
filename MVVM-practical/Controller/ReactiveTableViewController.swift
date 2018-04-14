//
//  ReactiveTableViewController.swift
//  MVVM-practical
//
//  Created by 123 on 13.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ReactiveTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.rowHeight = 100
        }
    }
    
    var cars: BehaviorRelay<[CarViewModel]> = BehaviorRelay(value: (UIApplication.shared.delegate as! AppDelegate).cars)
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        cars.asObservable().bind(to: tableView.rx.items(cellIdentifier: "CarCell",cellType: CarTableViewCell.self)) { (index, carViewModel: CarViewModel, cell) in
            cell.carViewModel = carViewModel
            }.disposed(by: disposeBag)
      
        
        let controleEvent = tableView.rx.itemSelected
        controleEvent.subscribe(onNext: { indexPath in
            self.performSegue(withIdentifier: "showCar", sender: indexPath)
            self.tableView.deselectRow(at: indexPath, animated: true)
        }).disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? IndexPath,
            let carVC = segue.destination as? CarViewController else { return }
        carVC.carViewModel = cars.value[indexPath.row]
    }


}



























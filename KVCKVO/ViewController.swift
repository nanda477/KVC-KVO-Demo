//
//  ViewController.swift
//  KVCKVO
//
//  Created by D2V iMac on 22/02/20.
//  Copyright © 2020 D2V iMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let data = Human()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*_______________________________KVC_____________________________________-*/
        /*
        let data = Human()
        data.account.balance = 10
        print(data.account.balance)
        
        data.account.setValue(1000, forKey: "balance")
        print(data.account.balance)
        print(data.account.value(forKey: "balance"))
        */
        
        /*******************************KVO****************************************/
        data.observeBalance()
        data.account.amountCredited(amount: 2000)

    }


}

class Bank: NSObject {
    
    @objc dynamic var balance = 0
    
    func balanceDeducted() {
        balance -= 25
    }
    
    func amountCredited(amount: Int) {
        balance += amount
    }
    
    func amountWithDraw(amount: Int) {
        balance -= amount
    }
    
}

class Human: NSObject {
    
    let account = Bank()
    
    func observeBalance() {
        
        account.addObserver(self, forKeyPath: #keyPath(Bank.balance), options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print(change)
    }
    
}


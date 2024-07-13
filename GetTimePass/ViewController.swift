//
//  ViewController.swift
//  GetTimePass
//
//  Created by Keshari  on 13/07/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date().addingTimeInterval(1500000000)
        let myDate = date.getTimePass(isDateOlderFromCurrent: false)
        let onlyTwoComponent = myDate.toStringFromLocaliseKey().components(separatedBy: "~").prefix(4).joined(separator: " ")
        print("onlyTwoComponent : \(onlyTwoComponent)")
        let completeTime = myDate.toStringFromLocaliseKey().components(separatedBy: "~").joined(separator: " ")
        print("completeTime : \(completeTime)")
        let monthCompont = myDate.month
        print("monthCompont : \(monthCompont)")
        
    }


}


//
//  ViewController.swift
//  cryptoTracker
//
//  Created by User on 14.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // Api Key - 07C996B7-1F9F-42CE-B9DE-6AEA26F6884E

    @IBOutlet weak var outputLabel: UILabel!
    
    var parser = JSONParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func parseButton(_ sender: Any) {
        parser.parse()
    }

}


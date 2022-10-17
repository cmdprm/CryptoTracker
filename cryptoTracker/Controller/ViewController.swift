//
//  ViewController.swift
//  cryptoTracker
//
//  Created by User on 14.10.2022.
//

import UIKit

class ViewController: UIViewController, RateManagerDelegate {
    
    // Api Key - 07C996B7-1F9F-42CE-B9DE-6AEA26F6884E
    
    // New temporary API Key - F6D2C5C7-AEFD-44FE-8DC1-36F02478CD0E

    @IBOutlet weak var outputLabel: UILabel!
    
    var parser = JSONParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parser.delegate = self
    }

    @IBAction func parseButton(_ sender: UIButton) {
        parser.setUpLink(title: (sender.titleLabel?.text)!)
    }
    
    func didUpdateRate(data: Rate) {
        DispatchQueue.main.async {
            self.outputLabel.text = "\(data.rate) \(data.asset_id_base)/\(data.asset_id_quote)"
        }
    }
}


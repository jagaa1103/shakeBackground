//
//  ViewController.swift
//  shakeBackground
//
//  Created by Enkhjargal Gansukh on 3/14/16.
//  Copyright © 2016 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        shakeNoDetect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var shakeStatusView: UILabel!
    
    func shakeNoDetect(){
        shakeStatusView.backgroundColor = UIColor(red: 254, green: 0, blue: 24, alpha: 1)
    }
}


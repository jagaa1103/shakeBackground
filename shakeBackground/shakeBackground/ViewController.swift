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

//    override func motionEnded(motion: UIEventSubtype,
//        withEvent event: UIEvent?) {
//            
//            if motion == .MotionShake{
//                print("Detected Shake")
//                shakeStatusView.backgroundColor = UIColor(red: 0, green: 254, blue: 120, alpha: 1)
//                NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "shakeNoDetect", userInfo: nil, repeats: false)
//            }else{
//                print("No Shake")
//                shakeNoDetect()
//            }       
//    }
    
    func shakeNoDetect(){
        shakeStatusView.backgroundColor = UIColor(red: 254, green: 0, blue: 24, alpha: 1)
    }
}


//
//  shakeService.swift
//  shakeBackground
//
//  Created by Enkhjargal Gansukh on 3/14/16.
//  Copyright © 2016 Enkhjargal Gansukh. All rights reserved.
//

import Foundation

import CoreMotion
import AudioToolbox

class ShakeService {
    
    class var sharedInstance: ShakeService {
        struct Static {
            static var instance: ShakeService?
        }
        if (Static.instance == nil) {
            Static.instance = ShakeService()
        }
        return Static.instance!
    }
    
    let motionManager = CMMotionManager()
    
    func start(){
        startMonitoringForAccelerometerUpdates()
    }
    
    func startMonitoringForAccelerometerUpdates() {
        if (self.motionManager.accelerometerAvailable) {
            self.motionManager.accelerometerUpdateInterval = 0.01
            self.motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) { (data, _) -> Void in
                print("x: \(data!.acceleration.x) y: \(data!.acceleration.y)  z: \(data!.acceleration.z)" )
            }
        }
    }
    
    func vibrateYourPhone(){
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
}
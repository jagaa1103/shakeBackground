//
//  AppDelegate.swift
//  shakeBackground
//
//  Created by Enkhjargal Gansukh on 3/14/16.
//  Copyright © 2016 Enkhjargal Gansukh. All rights reserved.
//

import UIKit
import CoreMotion

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var motionManager:CMMotionManager!
    
    let app = UIApplication.sharedApplication()
    
    var bgTask: UIBackgroundTaskIdentifier!
    
    var shakeCount = 0
    var backrefreshCount = 0
    
    var sensorData = NSMutableArray()
    var timer1 = NSTimer()
    var timer2 = NSTimer()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
                        startSensor()
        return true
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

    }

    func applicationDidEnterBackground(application: UIApplication) {
        timer1.invalidate()
        timer2.invalidate()
        print("applicationDidEnterBackground")
        self.bgTask = app.beginBackgroundTaskWithExpirationHandler() {
            self.app.endBackgroundTask(self.bgTask)
            self.bgTask = UIBackgroundTaskInvalid
        }
        
        timer1 = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: "applyForMoreTime", userInfo: nil, repeats: true)
//        timer2 = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "doSomething", userInfo: nil, repeats: true)
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        timer1.invalidate()
        timer2.invalidate()
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate {
    
    func applyForMoreTime() {
        if app.backgroundTimeRemaining < 10 {
//            self.app.endBackgroundTask(self.bgTask)
            self.bgTask = app.beginBackgroundTaskWithExpirationHandler() {
                self.app.endBackgroundTask(self.bgTask)
                self.bgTask = UIBackgroundTaskInvalid
                print("applyForMoreTime")
            }

        }
        doSomething()
    }
    
    func doSomething() {
        backrefreshCount = backrefreshCount + 1
        print("doing something, \(app.backgroundTimeRemaining) >>> backrefreshCount \(backrefreshCount)")
    }
    
    func startSensor(){
        motionManager = CMMotionManager()
        motionManager.accelerometerUpdateInterval = 0.2
        
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: {
            (data, error) in
            dispatch_async(dispatch_get_main_queue(),{
                self.sensorData.addObject(data!)
                print("\(data)")
                if(self.sensorData.count > 20){
                    print("Is Shake!!!")

                    self.sensorData.removeAllObjects()
                }
            });
        })
        
        
    }
}


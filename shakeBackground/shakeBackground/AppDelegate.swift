//
//  AppDelegate.swift
//  shakeBackground
//
//  Created by Enkhjargal Gansukh on 3/14/16.
//  Copyright © 2016 Enkhjargal Gansukh. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    var locationManager:CLLocationManager?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        startLocationService()
        startShakeDetect()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func startLocationService(){
        
        locationManager = CLLocationManager();
        
        if(CLLocationManager.authorizationStatus() == .NotDetermined){
            self.locationManager?.requestAlwaysAuthorization()
        }
        locationManager!.delegate = self;
        locationManager!.pausesLocationUpdatesAutomatically = false;
        locationManager!.allowsBackgroundLocationUpdates = true;
        locationManager!.startUpdatingLocation();
    }
    
    var timerShake:NSTimer? = nil;
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        if(timerShake == nil){
            timerShake = NSTimer.scheduledTimerWithTimeInterval(10.0, target: self, selector: #selector(AppDelegate.startShakeDetect), userInfo: nil, repeats: false)
        }
    }
    func startShakeDetect(){
        ShakeService.sharedInstance.start()
        timerShake?.invalidate()
        timerShake = nil
    }
}

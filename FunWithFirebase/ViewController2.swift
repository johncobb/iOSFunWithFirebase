//
//  ViewController2.swift
//  FunWithFirebase
//
//  Created by John Cobb on 8/24/17.
//  Copyright © 2017 Geodesity, LLC. All rights reserved.
//

import UIKit
import FirebaseAuth
import MapKit
import CoreLocation


class ViewController2: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet var map: MKMapView!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)


        map.setRegion(region, animated: true)
        
        
        print(location.speed)
        print(location.altitude)
        print(location.course)
        
        self.map.showsUserLocation = true
        
        
        
    }
    
    @IBAction func action(_ sender: UIButton) {
        
        try! Auth.auth().signOut()
        
        performSegue(withIdentifier: "segue2", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(Auth.auth().currentUser?.email ?? "N/A")
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

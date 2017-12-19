//
//  AddItemViewController.swift
//  ToDo
//
//  Created by Nino Rorudan on 12/19/17.
//  Copyright © 2017 The NTMC Foundation. All rights reserved.
//

import UIKit
import MapKit //to use the map
import CoreLocation //to find out current location
import CoreData




class AddItemViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtSubtitle: UITextField!
    @IBOutlet weak var myMapview: MKMapView!

    var location = CLLocation()
    
    //manager variable - keeps track of where are user is
    let manager = CLLocationManager()
    
    
    
    @IBAction func addItem(_ sender: Any)
    {
        if txtTitle.text != "" && txtSubtitle.text != ""
        {
            saveThis(title: txtTitle.text!, subtitle: txtSubtitle.text!, coordinates: "\(location.coordinate.latitude)$\(location.coordinate.longitude)")
            txtTitle.text = ""
            txtSubtitle.text = ""
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //immediately we start the manager once the app loads
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    //this function works the same as a timer; essentially this would refresh the map location everytime the user changes location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        location = locations[0] //locations are essentially stored in an array, they only get appended.  it is always [0] because that is the "newest" location
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01) //specifies how accurate the map coordinates are
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        myMapview.setRegion(region, animated:true)
        myMapview.showsUserLocation=true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function to save data
    func saveThis(title:String, subtitle:String, coordinates:String)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "ToDo", into: context)
        
        newItem.setValue(title, forKey: "title")
        newItem.setValue(subtitle, forKey: "subtitle")
        newItem.setValue(coordinates, forKey: "coordinates")
        
        do
        {
            try context.save()
            print("Saved")
        }
        catch
        {
            print("Error detected")
        }
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

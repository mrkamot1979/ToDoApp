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



class AddItemViewController: UIViewController {
    
    
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtSubtitle: UITextField!
    @IBOutlet weak var myMapview: MKMapView!

    //manager variable - keeps track of where are user is
    let manager = CLLocationManager()
    
    @IBAction func addItem(_ sender: Any)
    {
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //immediately we start the manager once the app loads
        manager.delegate = self
        manager.desiredAccuracy
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

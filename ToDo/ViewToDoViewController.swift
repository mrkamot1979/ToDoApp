//
//  ViewToDoViewController.swift
//  ToDo
//
//  Created by Nino Rorudan on 12/23/17.
//  Copyright © 2017 The NTMC Foundation. All rights reserved.
//

import UIKit
import MapKit

class ViewToDoViewController: UIViewController {
    
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtSubtitle: UILabel!
    @IBOutlet weak var myMapview: MKMapView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) //this function populates the TO DO view
    {
        txtTitle.text = titles[thisItem]
        txtSubtitle.text = subtitles[thisItem]
        
        //for the map
        if coordinates[thisItem].contains("$")
        {
            let array = coordinates[thisItem].components(separatedBy: "$")
            
            let latitude = CLLocationDegrees(array[0])
            let longitude = CLLocationDegrees(array[1])
            
            let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.02)
            let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
            let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
            myMapview.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = location
            myMapview.addAnnotation(annotation)
        }
        
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

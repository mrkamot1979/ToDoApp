//
//  ViewController.swift
//  ToDo
//
//  Created by Nino Rorudan on 11/21/17.
//  Copyright © 2017 The NTMC Foundation. All rights reserved.
//

import UIKit
import CoreData

//these arrays are used to hold the retrieved information that will populate the table
var titles:[String] = []
var subtitles:[String] = []
var coordinates:[String] = []


class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        saveThis(title: "Change batteries of Garmin", subtitle: "GSC-10 and HRM", coordinates: "35.530395$139.693453")
        
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
   
    
    //function to retrieve data
    func getThis()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDo")
        
        do
        {
            let results = try context.fetch(request)
            
            //IF mechanism below checks to see if there is data in the arrays.
            //if there is data, we reset them to zero to avoid display errors (e.g. duplicates, entries are shown 3 times, etc..)
            if results.count > 0
            {
                //clean the arrays first
                titles.removeAll()
                subtitles.removeAll()
                coordinates.removeAll()
                
                //loop through the results and store them in the newly cleaned arrays
                for result in results as! [NSManagedObject]
                {
                    //get title
                    if let myTitle
                }
            }
        }
        catch
        {
           print("Error retrieving data")
        }
        
        

        
 

    }

}


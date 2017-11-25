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
                    if let myTitle = result.value(forKey: "title") as? String //if the result key "title" can be converted into String 
                    {
                        titles.append(myTitle)
                    }
                    else
                    {
                        titles.append(" ")
                    }
                    
                    
                    //get subtitle
                    if let mySubtitle = result.value(forKey: "subtitle") as? String //if the result key "subtitle" can be converted into String
                    {
                        subtitles.append(mySubtitle)
                    }
                    else
                    {
                        subtitles.append(" ")
                    }
                    
                    
                    //get coordinates
                    if let myCoordinates = result.value(forKey: "coordinates") as? String //if the result key "coordinates" can be converted into String
                    {
                        coordinates.append(myCoordinates)
                    }
                    else
                    {
                        coordinates.append(" ")
                    }


                    

                }
            }
        }
        catch
        {
           print("Error retrieving data")
        }
        
        

        
 

    }

}


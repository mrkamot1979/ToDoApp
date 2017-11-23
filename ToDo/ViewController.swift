//
//  ViewController.swift
//  ToDo
//
//  Created by Nino Rorudan on 11/21/17.
//  Copyright © 2017 The NTMC Foundation. All rights reserved.
//

import UIKit
import CoreData

//these arrays are used to hold the retrieved information
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
            
            if results.count > 0
            {
                titles.removeAll()
                subtitles.removeAll()
                coordinates.removeAll()
                
                for result in results as! [NSManagedObjectContext]
                {
                  //Get Title
                    if let myTitle = result.value(forKey: "title") as? String
                    {
                            titles.append(myTitle)
                    }
                    else
                    {
                        
                    }
                }
        }
        catch <#pattern#>
        {
        
            <#statements#>
        }
        

    }

}


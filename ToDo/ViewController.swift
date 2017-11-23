//
//  ViewController.swift
//  ToDo
//
//  Created by Nino Rorudan on 11/21/17.
//  Copyright © 2017 The NTMC Foundation. All rights reserved.
//

import UIKit
import CoreData


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

    func saveThis()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "ToDo", into: context)
        
        newItem.setValue("Buy Milk", forKey: "title")
        newItem.setValue("Buy 5 litres of milk", forKey: "subtitle")
        newItem.setValue("14.656022$121.033713", forKey: "coordinates")
        
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

}


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
//this was placed here so that they are global
var titles:[String] = []
var subtitles:[String] = []
var coordinates:[String] = []

var thisItem:Int = 0 //this variable is used to hold the item that is going to be deleted / which one to access


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    //standard way of creating the tables; this line specifies the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        cell.detailTextLabel?.text = subtitles[indexPath.row]
        return cell
    }
    
    
    //this function listens for any editing action in the cell of the tableview e.g. if there are any insertion or deletion in the cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        //if mechanism to find out if the user did a "delete"
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            thisItem = indexPath.row //item that we want to delete
            deleteThis() //delets the item
            getThis() //reloads the table without the deleted item
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  //this function listens to the any touch/select on the tableview
    {
        thisItem = indexPath.row
        performSegue(withIdentifier: "show", sender: self) //segue to go to the individual ToDo view
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        //print(subtitles)
        
        //saveThis(title: "Exercise", subtitle: "Pullups 8x", coordinates: "222")
        //saveThis(title: "WFlows", subtitle: "Delivery", coordinates: "76543!")
        //saveThis(title: "ssWFlows", subtitle: "Dsdelivery", coordinates: "76543!")
    }
    
    override func viewDidAppear(_ animated: Bool) //this function refreshes the page after it reappears.  useful for updating the screen
    {
        getThis()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            
            //clean the arrays first
            titles.removeAll()
            subtitles.removeAll()
            coordinates.removeAll()

            
            if results.count > 0
            {
                
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
            myTableView.reloadData()
        }
         catch
        {
           print("Error retrieving data")
        }
    }


    //function to delete item
    //in general the deleteThis function receives the context from the commit editingStyle Delete table function.
    //once deleteThis() receives the context, it then cycles through the stored data to see if there is a match.
    //once the match is found, it is promptly deleted and the changes are immediately saved.
    func deleteThis()
    {
        //these lines are essentially the same as getThis() but it will be used to delete items.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDo")

        do
        {
            let results = try context.fetch(request)
            
            if results.count > 0
            {
                
                //FOR is used to loop through the stored data.
                for result in results as! [NSManagedObject]
                {
                    if let myTitle = result.value(forKey: "Title") as? String
                    {
                        if myTitle == titles[thisItem] //if myTitle is matched with thisItem
                        {
                            context.delete(result) //delete the data
                            do
                            {
                                try context.save() //immediately saves the data
                            }
                            catch
                            {
                                print("There was an error in the re-saving")
                            }
                        }
                        
                    }
                }
            }
        }
        catch
        {
            print("Error deleting data")
        }
    }
}



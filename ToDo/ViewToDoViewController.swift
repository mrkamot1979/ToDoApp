//
//  ViewToDoViewController.swift
//  ToDo
//
//  Created by Nino Rorudan on 12/23/17.
//  Copyright © 2017 The NTMC Foundation. All rights reserved.
//

import UIKit

class ViewToDoViewController: UIViewController {
    
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtSubtitle: UILabel!
    @IBOutlet weak var myMapview: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

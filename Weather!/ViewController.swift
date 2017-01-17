//
//  ViewController.swift
//  Weather!
//
//  Created by OSX on 17.01.2017.
//  Copyright © 2017 OSX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var degreeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


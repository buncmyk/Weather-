//
//  ViewController.swift
//  Weather!
//
//  Created by OSX on 17.01.2017.
//  Copyright © 2017 OSX. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate{

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var degreeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var cdeg: Int
    var descript: String
    var imageUrl: String
    var locationName: String
    override func viewDidLoad() {
        super.viewDidLoad()
        //set default labels on start
        cityLabel.text = "Type your city"
        degreeLabel.text = ""
        descriptionLabel.text = ""
        searchBar.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let urlRequest = URLRequest(url: URL(string: "http://api.apixu.com/v1/current.json?key=f08995fe7f4947948a4135634171701&q=\(searchBar.text!.replacingOccurrences(of: " ", with: "%20"))")!) //Read searchbar input city and replace spacing with %20
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            if error == nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                    
                    if let current = json["current"] as? [String : AnyObject] {
                        if let temperature = current["temp_c"] as? Int {
                            self.cdeg = temperature
                        }
                        if let condition = current["condition"] as? [String : AnyObject] {
                            self.descript = condition["text"] as! String
                            self.imageUrl = condition["icon"] as! String
                        }
                        if let location = json["location"] as? [String : AnyObject] {
                            self.locationName = location["name"] as! String
                        }
                    }
                    
                } catch let jsonErr{
                    print(jsonErr.localizedDescription)
                }
            }
        }
    }
}


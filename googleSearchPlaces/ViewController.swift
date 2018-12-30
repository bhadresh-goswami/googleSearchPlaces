//
//  ViewController.swift
//  googleSearchPlaces
//
//  Created by Mac on 29/12/18.
//  Copyright © 2018 tops. All rights reserved.
//

import UIKit
import MapKit
import SwiftyJSON

class ViewController: UIViewController,UISearchBarDelegate {
    //https://stackoverflow.com/questions/3439853/replace-occurrences-of-space-in-url
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var searchBarView: UISearchBar!
    
    let key = "AIzaSyAe6SPVDShh-vFTyEg7TEhWtU0dlHugL-k"
    
//https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Museum%20of%20Contemporary%20Art%20Australia&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=YOUR_API_KEY
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //
        
        
        
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let url_string = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=\(searchBar.text!)&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=\(key)"
        
        
        let url = URL.init(string: "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=destiny%20technologies%20palanur&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=AIzaSyAuWbx2on25Sk6yMxnK7Y_aqTUnhexzP6o")//"https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=\(searchBar.text!)&inputtype=textquery&fields=formatted_address,geometry&key=\(key)") //URL(string:"https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=\(searchBar.text!)&inputtype=textquery&fields=formatted_address,name,geometry&key=\(key)")
        print(url_string)
        print(url)
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        let dataTask = urlSession.dataTask(with: url!) { (data, res, err) in
            if err != nil{
                
            }
            else
            {
//                do
//                {
//                    let dict = try  JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String:Any]
//
//                    if dict["status"] != nil
//                    {
//                        if (dict["status"] as! String) == "OK"{
//
//                            let address = (dict["candidates"] as! [String:Any])["formatted_address"] as! String
//
//                            var latLong = [Double]()
//
////                            latLong.append(((dict["candidates"] as! [String:Any])["geometry"] as! [String:Double])["lat"]!)
////                            latLong.append(((dict["candidates"] as! [String:Any])["geometry"] as! [String:Double])["lng"]!)
//
//                            let locations = (dict["candidates"]!["geometry"]["location"]) as! [String:Double]
//
//
//
//                            self.setPlaceInMap(address: address, with: latLong)
//
//                        }
//                    }
//
//                }
//                catch let er as NSError{
//                    print(er.localizedDescription)
//                }
                
                do
                {
                    let dict = try JSON.init(data: data!)
                    
                    let d = dict.dictionaryValue["candidates"]![0]
                    print(d)
                    
                    let lat = d["geometry"]["location"]["lat"].double
                    
                    let long = d["geometry"]["location"]["lng"].double
                    let address = d["formatted_address"].string
                    
                    self.setPlaceInMap(address: address!, with: [lat!,long!])
                    
                }
                catch{
                    
                }
                
            }
        }
        
        dataTask.resume()
    }
    
    func setPlaceInMap(address:String, with latLong:[Double]) {
        
        
        print("\n\n\nData Found:")
        print(address)
        print(latLong)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


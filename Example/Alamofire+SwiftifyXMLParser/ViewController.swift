//
//  ViewController.swift
//  Alamofire+SwiftifyXMLParser
//
//  Created by Phan Thanh Tin on 3/9/17.
//  Copyright © 2017 Phan Thanh Tin. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://laodong.com.vn/rss/home.rss").responseXML(completionHandler: {
            response in
            switch response.result {
            case .success(let xml):
                var root = xml["rss","channel", "item"]
                var xmlRoot = xml["rss","channel", "item"].all
                var dateKey = "pubDate"
                for element in root {
                    let title  = element["title"].text
                    let link = element["link"].text
                    print(link)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


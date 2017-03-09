# Alamofire_XMLParser



Useful Extension to combine Alamofire and SwiftyXMLParser
# Requirements
* iOS 10.0+
* Swift .0+

# Installation
## CocoaPods

### 1. create Podfile
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Alamofire_XMLParser', :git => 'https://github.com/tin612/Alamofire_XMLParser.git'
```

### 2. install
```
> pod install
````

# Example

```swift
import Alamofire
import SwiftyXMLParser
import Alamofire_XMLParser

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

```

# Usage
#### 1. import Alamofire, SwiftyXMLParser and Alamofire_SwiftyXMLParser
```swift
import Alamofire
import SwiftyXMLParser
import Alamofire_XMLParser
```
#### 2. call responseXML(_:)
```swift
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

```

Alamofire callbacks a parsed value with SwiftyXMLParser.

# LICENSE
Copyright (c) 2017 Tin Phan
This reposities is Swift 3.0 version of https://github.com/kazuhiro4949/Alamofire-SwiftyXMLParser.

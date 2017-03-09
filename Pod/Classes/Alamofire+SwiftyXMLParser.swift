//
//  Alamofire+SwiftyXMLParser.swift
//  Pods
//
//  Created by Phan Thanh Tin on 3/9/17.
//
//

import Foundation
import Alamofire
import SwiftyXMLParser
extension DataRequest {
    static func xmlResponseSerializer(option: CharacterSet? = nil) -> DataResponseSerializer<XML.Accessor> {
        return DataResponseSerializer { request, response, data, error in
            guard error == nil else {
                return .failure(XMLError.parseError)
            }
            if let response = response, response.statusCode == 204 {
                return .success(XML.parse(Data()))
            }
            guard let validData = data, validData.count > 0 else {
                return .failure(XMLError.parseError)
            }
            
            let xml: XML.Accessor
            if let option = option {
                xml = XML.parse(validData, trimming: option)
            }
            else {
                xml = XML.parse(validData)
            }
            return .success(xml)
        }
    }
    
    @discardableResult
    func responseXML(
        queue: DispatchQueue? = nil, option: CharacterSet? = nil,
        completionHandler: @escaping (DataResponse<XML.Accessor>) -> Void ) -> Self {
        return response(queue: queue, responseSerializer: DataRequest.xmlResponseSerializer(option: option), completionHandler: completionHandler)
    }
}

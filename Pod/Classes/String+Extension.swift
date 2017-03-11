//
//  String+Extension.swift
//  News
//
//  Created by Phan Thanh Tin on 3/10/17.
//  Copyright © 2017 Nguyen Dang. All rights reserved.
//

import Foundation
extension String {
    
    func getImageURLsFromContent() -> String {
        let regex1 = "['\"][^'|^\"]*?(?:png|jpg|jpeg|gif|JPEG|JPG)[^'|^\"]*?['\"]"
        let regex = "['\"][^'|^\"]*?(?:png|jpg|jpeg|gif|JPEG|JPG)[^'|^\"]*?['\"]*?['?width']"
        var substr = self
        var result: [String] = []
        while let match = substr.range(of: regex, options: [ .regularExpression, .caseInsensitive]) {
            var matchingString = substr.substring(with: match)
            matchingString = matchingString.substring(from: matchingString.index(after: matchingString.startIndex))
            matchingString = matchingString.substring(to: matchingString.index(before: matchingString.endIndex))
            
            if matchingString.range(of: "http:", options: .caseInsensitive) != nil ||
                matchingString.range(of: "https://", options: .caseInsensitive) != nil {
                result.append(matchingString)
            }
            substr = substr.substring(from: matchingString.index(startIndex, offsetBy:matchingString.characters.count))
        }
        while let match = substr.range(of: regex1, options: [ .regularExpression, .caseInsensitive]) {
            var matchingString = substr.substring(with: match)
            matchingString = matchingString.substring(from: matchingString.index(after: matchingString.startIndex))
            matchingString = matchingString.substring(to: matchingString.index(before: matchingString.endIndex))
            
            if matchingString.range(of: "http:", options: .caseInsensitive) != nil ||
                matchingString.range(of: "https://", options: .caseInsensitive) != nil {
                result.append(matchingString)
            }
            substr = substr.substring(from: matchingString.index(startIndex, offsetBy:matchingString.characters.count))
        }
        if result.count > 0 {
            return result[0]
        }
        return String()
    }
    
}

extension String {
    func stringByDecodingHTMLEscapeCharacters() -> String {
        var s = self.replacingOccurrences(of: "&quot;", with: "\"")
        s = s.replacingOccurrences(of: "&apos;", with: "'")
        s = s.replacingOccurrences(of: "&amp;", with: "&")
        s = s.replacingOccurrences(of: "&lt;", with: "<")
        s = s.replacingOccurrences(of: "&gt;", with: ">")
        s = s.replacingOccurrences(of: "&#39;", with: "'")
        s = s.replacingOccurrences(of: "&ldquot;", with: "\"")
        s = s.replacingOccurrences(of: "&rdquot;", with: "\"")
        s = s.replacingOccurrences(of: "&nbsp;", with: " ")
        s = s.replacingOccurrences(of: "&aacute;", with: "á")
        s = s.replacingOccurrences(of:"&eacute;", with: "é")
        s = s.replacingOccurrences(of:"&iacute;", with: "í")
        s = s.replacingOccurrences(of:"&oacute;", with: "ó")
        s = s.replacingOccurrences(of:"&uacute;", with: "ú")
        s = s.replacingOccurrences(of:"&ntilde;", with: "ñ")
        s = s.replacingOccurrences(of:"&#8217;", with: "'")
        return s
    }
    
}


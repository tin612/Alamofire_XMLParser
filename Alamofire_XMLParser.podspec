#
#  Be sure to run `pod spec lint Alamofire_XMLParser.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name        = "Alamofire_XMLParser"
  s.version     = "1.2"
  s.summary     = "Alamofire extension for serialize NSData to SwiftyXMLParser"
  s.homepage    = "https://github.com/tin612/Alamofire_XMLParser"
  s.license     = { :type => "MIT" }
  s.authors     = { "Tin Phan" => "phantin612@gmail.com" }

  s.requires_arc = true
  s.ios.deployment_target = "9.0"
  s.source   = { :git => "https://github.com/tin612/Alamofire_XMLParser.git", :tag => s.version }
  s.source_files = "Pod/Classes/*.swift"
  s.dependency 'Alamofire'
  s.dependency 'SwiftyXMLParser'

end

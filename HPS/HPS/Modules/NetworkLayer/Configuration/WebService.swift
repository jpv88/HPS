//
//  WebService.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright © 2018 Jared Perez Vega. All rights reserved.
//

import Foundation
import Alamofire

class WebService {
    
    func loadFromWebService<T>(type: T.Type, endpoint: Endpoint) -> T? {
        let request = endpoint.getRequest      
        return nil
    }
    
    class func loadFromWebService() {
    
        let queryItems = [URLQueryItem(name: "term", value: "jack+johnson")]
        let urlComps = NSURLComponents(string: "https://itunes.apple.com/search")
        urlComps?.queryItems = queryItems
        guard let path = urlComps?.url else {return}
        
        Alamofire.request(path.absoluteString, method: .post, parameters: nil,
                          encoding: JSONEncoding.default).responseJSON { response in
                            
                            if let status = response.response?.statusCode {
                                switch(status){
                                case 200 ... 201:
                                    print("example success")
                                default:
                                    print("error with response status: \(status)")
                                }
                            }
                            
                            if let result = response.result.value {
                                let dictionary = result as! NSDictionary
                                let jsonData: NSData = try! JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData
                                let prettyStr = NSString(data: jsonData as Data, encoding: String.Encoding.utf8.rawValue)! as String
                                print(prettyStr)
                                do {
                                    
                                } catch _ as NSError {
                                    
                                }
                                
                                
                            }
        
    }
    }
}

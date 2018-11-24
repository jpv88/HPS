//
//  WebService.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright © 2018 Jared Perez Vega. All rights reserved.
//

import Foundation
import Alamofire

enum MyCustomError: Error {
    case NotParsedModel(String)
}

class WebService {
    
    private let decoder = JSONDecoder()
    
    init() {
        decoder.dateDecodingStrategy = .deferredToDate
    }
    
    func loadFromWebService<T>(type: T.Type, endpoint: Endpoint, completionHandler: @escaping (ItunesSearchServiceModel) -> Void, errorHandler: @escaping (Error) -> Void) {
        // show indicator
        let myRequest = endpoint.getRequest

        Alamofire.request(myRequest.path, method: myRequest.method, parameters: myRequest.parameters, encoding: JSONEncoding.default, headers: Constant.Base.headers).responseJSON { response in
            // hide indicator
            switch response.result {
            case .success( _):
                do {
                    if let data = response.data, let object = try? self.decoder.decode(ItunesSearchServiceModel.self, from: data) {
                        completionHandler(object)
                    } else {
                        throw MyCustomError.NotParsedModel("Model could not be parsed")
                    }
                }
                catch {
                    errorHandler(error)
                }
            case .failure(let error):
                errorHandler(error)
            }
        }
    }
    
//    class func loadFromWebService() {
//
//        Alamofire.request("https://itunes.apple.com/search?term=jack+johnson", method: .post, parameters: nil,
//                          encoding: JSONEncoding.default, headers: Constant.Base.headers).responseJSON { response in
//
//                            switch response.result {
//                            case .success(let JSON):
//                                print("Success with JSON: \(JSON)")
//                                do {
//                                    if let data = response.data as? Data, let obj = try? decoder.decode(ItunesSearchServiceModel.self, from: data) {
//                                        print(obj)
//                                    } else {
//                                        throw MyCustomError.NotParsedModel("Model could not be parsed")
//                                    }
//                                }
//                                catch {
//                                    // return completion error
//                                    print("Something Wrong! \(error)")
//                                }
//
//                            case .failure(let error):
//                                // return completion error
//                                break
//                            }
//
//    }
//    }
}

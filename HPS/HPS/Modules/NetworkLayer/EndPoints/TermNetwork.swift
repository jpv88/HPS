//
//  TermNetwork.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright © 2018 Jared Perez Vega. All rights reserved.
//

import Foundation

struct TermNetwork: Requestable {
    
    var method: HTTPMethod = .post
    var path: String
    var parameters: [String : String]? = nil
    
    init(artist: String) {
        let formatedArtist = artist.lowercased().replacingOccurrences(of: " ", with: "+")
        let queryItems = [URLQueryItem(name: "term", value: formatedArtist)]
        let urlComps = NSURLComponents(string: Constant.Base.url)
        urlComps?.queryItems = queryItems
        path = urlComps?.url?.absoluteString ?? ""
    }
    
}

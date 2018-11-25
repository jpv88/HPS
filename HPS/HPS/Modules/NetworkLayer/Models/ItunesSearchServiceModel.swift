//
//  ItunesSearchServiceModel.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright © 2018 Jared Perez Vega. All rights reserved.
//

import Foundation

import Foundation

struct ItunesSearchServiceModel: Codable {
    let resultCount: Int?
    var results: [Result]?
}

struct Result: Codable {
    let wrapperType: String?
    let kind: String?
    let artistId, collectionId, trackId: Int?
    let artistName: String?
    let collectionName, trackName, collectionCensoredName, trackCensoredName: String?
    let artistViewUrl, collectionViewUrl, trackViewUrl: String?
    let previewUrl: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let trackPrice: Double?
    let primaryGenreName: String?
    let trackTimeMillis: Int?
//    lazy var isSelected: Bool? = {
//        return false
//    }()
}

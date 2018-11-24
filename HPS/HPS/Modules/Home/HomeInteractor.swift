//
//  HomeInteractor.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

class HomeInteractor: HomePresenterToInteractorProtocol{
    
    var presenter: HomeInteractorToPresenterProtocol?
    
    private let webService = WebService()    
    private var data: ItunesSearchServiceModel?
    
    func fetchArtist(input: String) {
        
        webService.loadFromWebService(type: ItunesSearchServiceModel.self, endpoint: .term(artist: input), completionHandler: { result in
            self.data = result
            self.presenter?.fetchSuccess(model: result)
        }) { error in
            self.presenter?.fetchFail(error: error)
        }
    }
    
    func filter(by: FilterModel) {
        guard let result = data, let data = result.results else {
            presenter?.filteredFail()
            return
        }
        switch by {
        case .duration:
            let filteredArray = data.sorted(by: { (first, second) -> Bool in
                let firstDuration = first.trackTimeMillis ?? 0
                let secondDuration = second.trackTimeMillis ?? 0
                return (firstDuration < secondDuration)
            })
            var object = result
            object.results = filteredArray
            presenter?.filteredSuccess(model: object)
        case .genre:
            let filteredArray = data.sorted(by: { (first, second) -> Bool in
                let firstGenre = first.primaryGenreName ?? ""
                let secondGenre = second.primaryGenreName ?? ""
                return (firstGenre == secondGenre)
            })
            var object = result
            object.results = filteredArray
            presenter?.filteredSuccess(model: object)
        case .price:
            let filteredArray = data.sorted(by: { (first, second) -> Bool in
                let firstPrice = first.trackPrice ?? 0.0
                let secondPrice = second.trackPrice ?? 0.0
                return firstPrice.isLess(than: secondPrice)
            })
            var object = result
            object.results = filteredArray
            presenter?.filteredSuccess(model: object)
        }
  
    }
}

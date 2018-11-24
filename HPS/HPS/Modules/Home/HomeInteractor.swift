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
        
        webService.loadFromWebService(type: ItunesSearchServiceModel.self, endpoint: .term(artist: "Jack Jonhson"), completionHandler: { result in
            self.data = result
            self.presenter?.fetchSuccess(model: result)
        }) { error in
            self.presenter?.fetchFail(error: error)
        }
    }
    
    func filter(by: FilterModel) {
        guard let result = data, var data = result.results else {
            presenter?.filteredFail()
            return
        }
        switch by {
        case .duration:
            break
        case .genre:
            break
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

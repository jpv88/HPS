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
    
    func fetchArtist(input: String) {
        
        webService.loadFromWebService(type: ItunesSearchServiceModel.self, endpoint: .term(artist: "Jack Jonhson"), completionHandler: { result in
            self.presenter?.fetchSuccess(model: result)
        }) { error in
            self.presenter?.fetchFail(error: error)
        }
    }
}

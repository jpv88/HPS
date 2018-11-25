//
//  DetailPresenter.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

class DetailPresenter: DetailViewToPresenterProtocol {
    
    var view: DetailPresenterToViewProtocol?
    var interactor: DetailPresenterToInteractorProtocol?
    var router: DetailPresenterToRouterProtocol?
    
    var data: ItunesSearchServiceModel? 
    var position: Int?
    
    func loadView() {
        setUIWithArtist()
    }
    
    func leftAction() {
        
    }
    
    func playAction() {
        
    }
    
    func stopAction() {
        
    }
    
    func rightAction() {
        
    }
    
    private func setUIWithArtist() {
        if let result = data?.results, let position = position {
            view?.songTitleLabel.text = result[position].artistName ?? ""
        }
    }
}

extension DetailPresenter: DetailInteractorToPresenterProtocol {}

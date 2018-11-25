//
//  DetailPresenter.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit
import AVFoundation

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
        if let result = data?.results, let position = position, let vc = view as? UIViewController {
            if let videoURL = URL(string: result[position].previewUrl ?? "") {
                view?.player = AVPlayer(url: videoURL)
                let playerLayer = AVPlayerLayer(player: view?.player)
                playerLayer.frame = CGRect.zero
                vc.view.layer.addSublayer(playerLayer)
                view?.player.play()
            }
        }
    }
    
    func stopAction() {
        if let player = view?.player {
            player.pause()
        }
    }
    
    func rightAction() {
        
    }
    
    private func setUIWithArtist() {
        if let result = data?.results, let position = position {
            view?.songTitleLabel.text = result[position].trackCensoredName ?? ""
        }
    }
}

extension DetailPresenter: DetailInteractorToPresenterProtocol {}

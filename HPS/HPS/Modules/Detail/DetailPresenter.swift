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
        if let result = data?.results, let position = position, let videoURL = URL(string: result[position].previewUrl ?? "") {
            view?.player = AVPlayer(url: videoURL)
        }
        setUpUIWithArtist()
    }
    
    func leftAction() {
        if let position = self.position, let elements = data?.resultCount {
            stopAction()
            interactor?.left(position: position, elements: elements)
        }
    }
    
    func playAction() {
        if let result = data?.results, let position = position, let vc = view as? UIViewController {
            if let videoURL = URL(string: result[position].previewUrl ?? "") {
                stopAction()
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
        if let position = self.position, let elements = data?.resultCount {
            stopAction()
            interactor?.right(position: position, elements: elements)
        }
    }
    
    func shareAction() {
        if let result = data?.results, let position = position, let vc = view as? UIViewController {
            if let videoURL = URL(string: result[position].previewUrl ?? "") {
                stopAction()
                router?.navigateToShare(url: videoURL, origin: vc)
            }
        }
    }
    
    private func setUpUIWithArtist() {
        if let result = data?.results, let position = position {
            view?.songTitleLabel.text = result[position].trackCensoredName ?? ""
        }
    }
}

extension DetailPresenter: DetailInteractorToPresenterProtocol {
    func playerUpdated(newPosition: Int) {
        self.position = newPosition
        setUpUIWithArtist()
        playAction()
    }
}

//
//  DetailProtocols.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit
import AVFoundation

protocol DetailPresenterToViewProtocol: class{
    var songTitleLabel: UILabel! {get set}
    var player: AVPlayer! {get set}
}

protocol DetailInteractorToPresenterProtocol: class{}

protocol DetailPresenterToInteractorProtocol: class{
    var presenter: DetailInteractorToPresenterProtocol? {get set}
}

protocol DetailViewToPresenterProtocol: class{
    var view: DetailPresenterToViewProtocol? {get set}
    var interactor: DetailPresenterToInteractorProtocol? {get set}
    var router: DetailPresenterToRouterProtocol? {get set}
    var data: ItunesSearchServiceModel? {get set}
    var position: Int? {get set}
    func loadView()
    func leftAction()
    func playAction()
    func stopAction()
    func rightAction()
    func shareAction()
}

protocol DetailPresenterToRouterProtocol: class{
    static func createModule(model: ItunesSearchServiceModel, position: Int) -> UIViewController
}

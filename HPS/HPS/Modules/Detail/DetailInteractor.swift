//
//  DetailInteractor.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit
import AVFoundation

class DetailInteractor: DetailPresenterToInteractorProtocol{
    
    var presenter: DetailInteractorToPresenterProtocol?
    
    func left(position: Int, elements: Int) {
        var result: Int
        if position == 0 {
            result = elements - 1
        } else {
            result = position - 1
        }
        presenter?.playerUpdated(newPosition: result)
    }
    
    func right(position: Int, elements: Int) {
        var result: Int
        if position == elements - 1 {
            result = 0
        } else {
            result = position + 1
        }
        presenter?.playerUpdated(newPosition: result)
    }
}

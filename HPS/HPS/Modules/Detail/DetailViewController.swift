//
//  DetailViewController.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    @IBOutlet weak var songTitleLabel: UILabel!
    
    var presenter: DetailViewToPresenterProtocol?
    
    var player: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.loadView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presenter?.stopAction()
    }
    
    @IBAction func playerLeftButton(_ sender: UIButton) {
        presenter?.leftAction()
    }
    
    @IBAction func playerPlayButton(_ sender: UIButton) {
        presenter?.playAction()
    }
    
    @IBAction func playerStopButton(_ sender: UIButton) {
        presenter?.stopAction()
    }
    
    @IBAction func playerRightButton(_ sender: UIButton) {
        presenter?.rightAction()
    }
    
    @IBAction func shareButton(_ sender: UIButton) {
        presenter?.shareAction()
    }
    
}

extension DetailViewController: DetailPresenterToViewProtocol {}

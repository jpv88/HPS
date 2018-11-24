//
//  ItunesTableViewCell.swift
//  HPS
//
//  Created by Jared Perez Vega on 24/11/2018.
//  Copyright © 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

class ItunesTableViewCell: UITableViewCell {

    @IBOutlet weak var priceTitleLabel: UILabel!
    @IBOutlet weak var genreTitleLabel: UILabel!
    @IBOutlet weak var durationTitleLabel: UILabel!
    @IBOutlet weak var artistTitleLabel: UILabel!
    @IBOutlet weak var songTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    func displayData(song: String, artist: String, duration: String, genre: String, price: String) {
        songTitleLabel.text = song
        artistTitleLabel.text = artist
        durationTitleLabel.text = duration
        genreTitleLabel.text = genre
        priceTitleLabel.text = price
    }
    
}

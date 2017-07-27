//
//  PostHeaderCell.swift
//  BobaBeacon
//
//  Created by TheGirlCode on 7/27/17.
//  Copyright © 2017 The Girl Code. All rights reserved.
//


import UIKit

class PostHeaderCell: UITableViewCell {
    static let height: CGFloat = 54
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    @IBAction func optionsButtonTapped(_ sender: Any) {
        print("option buttons tapped")
    }
    
    
}
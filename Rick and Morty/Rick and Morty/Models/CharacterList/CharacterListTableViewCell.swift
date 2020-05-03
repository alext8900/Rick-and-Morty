//
//  CharacterListTableViewCell.swift
//  Rick and Morty
//
//  Created by Alex Thompson on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class CharacterListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterTypeLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        setupImage()
    }
    
    func setupImage() {
        characterImage.layer.cornerRadius = characterImage.frame.height / 2
        characterImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

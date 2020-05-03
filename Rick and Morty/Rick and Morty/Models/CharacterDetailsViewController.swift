//
//  CharacterDetailsViewController.swift
//  Rick and Morty
//
//  Created by Alex Thompson on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    private let viewModel: CharactersDetailViewModel
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    init(viewModel: CharactersDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "CharacterDetailsViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Some stuff happened")
    }
    
    func updateUI() {
        nameLabel.text = viewModel.character.name
        statusLabel.text = viewModel.character.status
        speciesLabel.text = viewModel.character.species
        genderLabel.text = viewModel.character.gender
        originLabel.text = viewModel.character.origin
        locationLabel.text = viewModel.character.location
        imageView.sd_setImage(with: viewModel.character.imageUrl, placeholderImage: UIImage(named: "placeholder"))
        
        navigationController?.navigationBar.tintColor = .white
    }
}

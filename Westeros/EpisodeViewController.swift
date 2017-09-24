//
//  EpisodeViewController.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 24/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {


    @IBOutlet weak var textViewEpisode: UITextView!
    let model: Episode
    
    @IBOutlet weak var labelSeason: UILabel!
    @IBOutlet weak var lableEpisode: UILabel!
    
    init(model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = model.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func syncViewWithModel() {
        labelSeason.text = model.season?.name
        lableEpisode.text = model.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
    }

}

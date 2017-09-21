//
//  HouseViewController.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 4/7/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var sigilView: UIImageView!
    @IBOutlet weak var wordsView: UILabel!
    
    private let _model : House
    
    // MARK : -  Init
    init(model: House) {
        _model = model
        super.init(nibName: nil, bundle: nil)
        title = "\(_model.name) (\(_model.sigil.description))"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK : -  View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        syncModelWithView()
        addButtons()
        
    }
    
    // MARK : - Actions
    @objc func displayWiki(){
        
        
        // Create a WikiVC
        let wVC = WikiViewController(model: _model)
        
        // Push it & forget
        navigationController?.pushViewController(wVC, animated: true)
    }
    
    // MARK : - Misc
    func addButtons(){
    
        let wikiBtn = UIBarButtonItem(title: "Wiki", style: .plain
            , target: self, action: #selector(displayWiki))
        
        navigationItem.rightBarButtonItem = wikiBtn
    }
    
    
    func syncModelWithView(){
        sigilView.image = _model.sigil.image
        nameView.text = "House \(_model.name)"
        wordsView.text = _model.words
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

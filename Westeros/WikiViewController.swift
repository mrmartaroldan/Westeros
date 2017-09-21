//
//  WikiViewController.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 4/7/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {

    private let _model : House
    
    @IBOutlet weak var browserView: UIWebView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    // MARK : - Init
    init(model: House){
        _model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK : -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        browserView.delegate = self
        syncViewWithModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }


    
    // MARK : -  Misc
    func syncViewWithModel(){
        
        activityView.isHidden = false
        activityView.startAnimating()
        browserView.loadRequest(URLRequest(url: _model.wikiURL))
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK : - Delegate methods
extension WikiViewController: UIWebViewDelegate{
    func webViewDidFinishLoad(_ webView: UIWebView){
        
        activityView.isHidden = true
        activityView.stopAnimating()
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if navigationType == .other {
            return true
        }else{
            return false
        }
    }
}

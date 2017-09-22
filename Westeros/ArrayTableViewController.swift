//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 21/9/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {

    let arrayDataSource : ArrayDataSource<Element>
    let delegate: BaseViewControllerDelegate<Element>?
    
    init(arrayDataSource: ArrayDataSource<Element>,
         title: String,
         style: UITableViewStyle,
         delegate: BaseViewControllerDelegate<Element>? = nil) {
        
        self.arrayDataSource = arrayDataSource
        self.delegate = delegate
        super.init(style: style)
        self.title = title
        tableView.dataSource = self.arrayDataSource
	
        self.delegate?.viewController = self
        self.delegate?.source = arrayDataSource
    
        self.tableView.delegate = self.delegate as? UITableViewDelegate
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath)")
    }

}

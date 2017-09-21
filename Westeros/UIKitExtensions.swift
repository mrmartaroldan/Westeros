//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 4/7/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

extension UIViewController{
    func wrappedInNavigation()->UIViewController{
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
}

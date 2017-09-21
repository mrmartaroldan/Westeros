//
//  Character.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 4/7/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation

final class Person {
    let name    : String
    private let _alias   : String?
    let house   : House
    
    var alias : String {
        get{
            return _alias ?? ""
        }
        
    }
    
    init(name: String, alias: String?, house: House) {
        
        (self.name, _alias, self.house) = (name, alias, house)
    }
    
    convenience init(name: String, house: House){
        self.init(name: name, alias: nil, house: house)
    }
}


extension Person{
    var fullName : String{
        return "\(name) \(house.name)"
    }
}

// MARK : -  Proxies
extension Person{
    
    private var _proxyForComparison : String{
        return "\(fullName) \(house.name)"
    }
    
    private var _proxyForHash : Int{
        return _proxyForComparison.hash
    }
}


// MARK : -  Protocols
extension Person : CustomStringConvertible{
    var description: String {
        return "<\(type(of: self)): \(fullName)>"
    }

    
}

extension Person : Equatable{
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return (lhs._proxyForComparison == rhs._proxyForComparison)
    }
    
    
}

extension Person : Hashable{
    var hashValue: Int {
        return _proxyForHash
    }

    
}




























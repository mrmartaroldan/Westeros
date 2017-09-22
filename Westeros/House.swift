//
//  House.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 4/7/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

typealias Words = String
typealias Members = Set<Person>

final class House{
    
    let name  : String
    let sigil : Sigil
    let words : Words
    let wikiURL : URL
    var _members : Members
    
    init(name: String, sigil: Sigil, words: Words, url: URL) {
        (self.name, self.sigil, self.words, wikiURL) = (name, sigil, words, url)
        _members = Members()
    }
    
}

final class Sigil{
    
    let description : String
    let image : UIImage
    
    init(image : UIImage, description: String) {
        (self.description, self.image) = (description, image)
    }
}


extension House{
    var count : Int{
        return _members.count
    }
    
    func add(person: Person){
        
        guard person.house == self else{
            return
        }
        
        _members.insert(person)
    }
    
    func add(persons: Person...){
        _members = _members.union(persons.filter{$0.house == self})
    }
}

// MARK : -  Proxies
extension House{
    var _proxyForComparison : String{
        return "\(name) \(words) \(sigil.description) \(wikiURL)"
    }
}

// MARK : - Protocols
extension House : CustomStringConvertible{
    var description: String {
        return "<\(type(of:self)): \(name)>"
    }

}

extension House : Equatable{
    static func ==(lhs: House, rhs: House) -> Bool {
        return (lhs._proxyForComparison == rhs._proxyForComparison)
    }

    
}













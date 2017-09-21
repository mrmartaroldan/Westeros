//
//  Repository.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 4/7/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation


final class Repository{
    static let local : HouseFactory = LocalFactory()
    
    private init(){} // make sure no one can create an instance
}

protocol HouseFactory {
    
    var houses : [House] {get}
    func house(named: String) -> House?
}

final class LocalFactory : HouseFactory{
    var houses: [House]{
        
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
        
        let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!)
        let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!)
        
        let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
        let arya = Person(name: "Arya", house: stark)
        let tyrion = Person(name: "Tyrion", alias: "The imp", house: lannister)
        let cersei = Person(name: "Cersei", house: lannister)
        
        stark.add(persons: arya, robb)
        lannister.add(persons: tyrion, cersei)
        
        return [stark, lannister]
    }
    
    func house(named: String)->House?{
        
        let normalizedName = named.uppercased()
        let singleHouse = houses.filter{$0.name.uppercased() == normalizedName}
        return singleHouse.first
        
    }

}








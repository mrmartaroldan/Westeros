//
//  Repository.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 4/7/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import Foundation


final class Repository{
    static let local = LocalFactory()
    
    private init(){} // make sure no one can create an instance
}

protocol HouseFactory {
    
    var houses : [House] {get}
    func house(named: String) -> House?
    typealias FilterHouse = (House) -> Bool
    func houses(filteredBy: FilterHouse) -> [House]
    
    var seasons : [Season] {get}
    typealias FilterSeason = (Season) -> Bool
    func seasons(filteredBy: FilterSeason) -> [Season]
    
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
    
    func houses(filteredBy: FilterHouse) -> [House] {
        let result = Repository.local.houses.filter(filteredBy)
        return result
    }
    

    var seasons: [Season] {
        //get {
	    //Seasons
            let t1 = Season(name: "Season 1", releaseDate: "17/04/2011".stringToDate())
            let t2 = Season(name: "Season 2", releaseDate: "01/04/2012".stringToDate())
            let t3 = Season(name: "Season 3", releaseDate: "31/03/2013".stringToDate())
            let t4 = Season(name: "Season 4", releaseDate: "06/04/2014".stringToDate())
            let t5 = Season(name: "Season 5", releaseDate: "12/04/2015".stringToDate())
            let t6 = Season(name: "Season 6", releaseDate: "24/04/2016".stringToDate())
            
	    //Episodes
        //Season 1
            let e101 = Episode(title: "Winter is coming", emissionDate: "17/04/2011".stringToDate(), season: t1)
            let e102 = Episode(title: "The kingsroad", emissionDate: "24/04/2011".stringToDate(), season: t1)
            
        //Season 2
            let e201 = Episode(title: "The nord remembers", emissionDate: "01/04/2012".stringToDate(), season: t2)
            let e202 = Episode(title: "The nigth lands", emissionDate: "08/04/2012".stringToDate(), season: t2)
            
        //Season 3
            let e301 = Episode(title: "Valar Dohaeris", emissionDate: "31/03/2013".stringToDate(), season: t3)
            let e302 = Episode(title: "Dark wings, dark words", emissionDate: "07/04/2013".stringToDate(), season: t3)
            
        //Season 4
            let e401 = Episode(title: "Two swords", emissionDate: "06/04/2014".stringToDate(), season: t4)
            let e402 = Episode(title: "The lion and the rose", emissionDate: "13/04/14".stringToDate(), season: t4)
            
        //Season 5
            let e501 = Episode(title: "The wars to come", emissionDate: "12/04/2015".stringToDate(), season: t5)
            let e502 = Episode(title: "The house of black and white", emissionDate: "19/04/2015".stringToDate(), season: t5)
            
        //Season 6
            let e601 = Episode(title: "The red woman", emissionDate: "24/04/2016".stringToDate(), season: t6)
            let e602 = Episode(title: "Home", emissionDate: "01/05/16".stringToDate(), season: t6)

            t1.add(episodes: e101, e102)
            t2.add(episodes: e201, e202)
            t3.add(episodes: e301, e302)
            t4.add(episodes: e401, e402)
            t5.add(episodes: e501, e502)
            t6.add(episodes: e601, e602)
            return [t1, t2, t3, t4, t5, t6]
        }
    
    func season(title: String) -> Season? {
        
        let normalizedTitle = title.uppercased()
        let season = seasons.filter{ $0.name.uppercased() == normalizedTitle}
        return season.first
    }
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        let result = Repository.local.seasons.filter(filteredBy)
        return result
    }
    
}

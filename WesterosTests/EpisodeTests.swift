//
//  EpisodeTests.swift
//  WesterosTests
//
//  Created by Marta Roldán Arellano on 22/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {

    var season1 : Season!
    var season2 : Season!
    var season3 : Season!
    var episode1 : Episode!
    var episode2 : Episode!
    var episode3 : Episode!
    var episode4 : Episode!
    
    override func setUp() {
        super.setUp()
        
        season1 = Season(name: "Season 1", releaseDate: "17/04/2011".stringToDate())
        season2 = Season(name: "Season 2", releaseDate: "01/04/2012".stringToDate())

        episode1 = Episode(title: "Winter is coming", emissionDate: "17/04/2011".stringToDate(), season: season1)
        episode2 = Episode(title: "The nord remembers", emissionDate: "01/04/2012".stringToDate(), season: season2)
        
        season3 = Season(name: "Season 1", releaseDate: "17/04/2011".stringToDate())
        episode4 = Episode(title: "Winter is coming", emissionDate: "17/04/2011".stringToDate(), season: season3)

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEpisodeCustomStringConvertible() {
        let e1: String = episode1.description
        XCTAssertEqual(e1, "Winter is coming. Premiere: 17 abr 2011")
        XCTAssertNotEqual(e1, "The nord remembers. Premiere: 01 abr 2012")
    }
    
    func testEpisodeExistence(){
        XCTAssertNotNil(episode1)
    }
    
    func testEpisodeEquality(){
        
        // Identidad
        XCTAssertEqual(episode1, episode1)
        //Igualdad
        XCTAssertEqual(episode1, episode4)
        //Desigualdad
        XCTAssertNotEqual(episode1, episode2)
    }

    func testEpisodeHashable() {
        XCTAssertNotNil(episode1.hashValue)
    }
    
    func testEpisodeComparison() {
        XCTAssertLessThan(episode1, episode2)
        XCTAssertGreaterThan(episode2, episode1)
    }
}
    

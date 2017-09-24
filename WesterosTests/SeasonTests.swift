//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by Marta Roldán Arellano on 22/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {

    var season1 : Season!
    var season2 : Season!
    var season3 : Season!
    
    override func setUp() {
        super.setUp()
        
        season1 = Season(name: "Season 1", releaseDate: "17/04/2011".stringToDate())
        season2 = Season(name: "Season 1", releaseDate: "17/04/2011".stringToDate())
        season3 = Season(name: "Season 3", releaseDate: "31/03/2013".stringToDate())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSeasonExistence(){
        XCTAssertNotNil(season1)
    }
    
    func testSeasonEquality(){
        
        // Identidad
        XCTAssertEqual(season1, season1)
        //Igualdad
        XCTAssertEqual(season1, season2)
        //Desigualdad
        XCTAssertNotEqual(season1, season3)
    }

    func testSeasonHashable() {
        XCTAssertNotNil(season1.hashValue)
    }
    
    func testSeasonComparison() {
        XCTAssertLessThan(season1, season3)
        XCTAssertGreaterThan(season3, season1)
    }
}
    

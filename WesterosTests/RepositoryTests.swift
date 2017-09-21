//
//  RepositoryTests.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 4/7/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation(){
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation(){
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 2)
        
    }
    
    func testLocalRepositoryCreateHousesByName(){
        
        // Check exising
        let stark = Repository.local.house(named: "Stark")
        XCTAssertNotNil(stark)
        XCTAssertEqual(stark?.name, "Stark")
        
        // Check non existing
        let nonExistant = Repository.local.house(named: "Grijander")
        XCTAssertNil(nonExistant)
        
        
        // Check case-insensitivity
        let lannister = Repository.local.house(named: "laNNisTer")
        XCTAssertNotNil(lannister)
        XCTAssertEqual(lannister?.name, "Lannister")
    }
    
}

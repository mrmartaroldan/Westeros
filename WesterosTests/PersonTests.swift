//
//  CharacterTests.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 4/7/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import XCTest

@testable import Westeros

class PersonTests: XCTestCase {
    
    var starkImage : UIImage!
    var lannisterImage : UIImage!
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
    
    var lannisterHouse : House!
    var starkHouse : House!
    
    var robb : Person!
    var arya : Person!
    var tyrion : Person!
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")

        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        
        starkHouse = Repository.local.house(named: "Stark")
        lannisterHouse = Repository.local.house(named: "Lannister")
        
        robb = Person(name: "Robb", alias: "The Young Wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateCharacter(){
        XCTAssertNotNil(robb)
        XCTAssertNotNil(arya)
        XCTAssertNotNil(tyrion)
      
    }
    
    func testFullName(){
        
        XCTAssertEqual(robb.fullName, "Robb Stark")
        XCTAssertEqual(tyrion.fullName, "Tyrion Lannister")
        XCTAssertEqual(arya.fullName, "Arya Stark")
    }
    
    
    func testStringConversion(){
        XCTAssertEqual(robb.description, "<Person: Robb Stark>")
        
    }
}

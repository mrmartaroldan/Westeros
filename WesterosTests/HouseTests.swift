//
//  HouseTests.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 4/7/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
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
        
        starkHouse = Repository.local.house(named: "stark")
        lannisterHouse = Repository.local.house(named: "Lannister")
        
        robb = Person(name: "Robb", alias: "The Young Wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateSigil(){
        
        let starkSigil = Sigil(image: starkImage, description: "Direwolf")
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        XCTAssertNotNil(lannisterSigil)
        
        
    }
    
    func testCreateHouse(){
        
        let starkSigil = Sigil(image: starkImage, description: "Direwolf")
        let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is Coming!", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Stark")!)
        XCTAssertNotNil(stark)
    }
    
    func testAddingPerson(){
        
        let ned = Person(name: "Eddard", house: starkHouse)
        
        XCTAssertEqual(starkHouse.count, 2)
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 2)
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        starkHouse.add(person: ned)
        XCTAssertEqual(starkHouse.count, 3)
        
    }
    
    func testAddingPersons(){
        starkHouse.add(persons: arya, robb, tyrion)
        XCTAssertEqual(starkHouse.count, 2)
    }
    
    class Bar : Equatable{
        let name : String
        
        init(name: String) {
            self.name = name
        }
        
        static func ==(lhs: Bar, rhs: Bar) -> Bool{
            return (lhs.name == rhs.name)
        }
    }
    
    
    func testEquatable(){
 
        let stark2 = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Stark")!)
        let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Stark")!)
        
        XCTAssertEqual(stark2, stark)
        XCTAssertEqual(starkHouse, starkHouse)
        XCTAssertEqual(starkHouse, stark2)
        XCTAssertEqual(starkHouse, stark)
        
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testThatWikiURLIsValidURL(){
        
        let urls : [URL] = Repository.local.houses.map{$0.wikiURL}
        for url in urls{
            XCTAssertNotNil(url)
        }
    }
}



















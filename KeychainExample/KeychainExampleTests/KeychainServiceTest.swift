//
//  KeychainServiceTest.swift
//  KeychainExampleTests
//
//  Created by Diplomado on 19/01/24.
//

import XCTest
@testable import KeychainExample

final class KeychainServiceTest: XCTestCase {
    let service = KeychainService()
    let testKey:String = "testKey:\(UUID().uuidString)"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        service.delete(key: testKey)
    }

    func testSaveKeyWhithoutError() throws {
        try! service.save(key: testKey, value: "IAmVenagnce!🦇")
        XCTAssert(true)
    }
    func testSaveAndLoadKey() throws {
        try! service.save(key: testKey, value: "IAmVenagnce!🦇")
        let result = try! service.load(key: testKey)
        XCTAssertEqual(result, "IAmVenagnce!🦇")
    }
    
    func testDeleteKey() throws{
        let key = "Nanananana Batman"
        try! service.save(key: key, value: "IAmVenagnce!🦇")
        service.delete(key: key)
        let result = try? service.load(key: key)
        XCTAssertNil(result)
    }
    

}

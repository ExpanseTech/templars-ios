//
//  CustomerTest.swift
//  
//
//  Created by Tochi on 22/01/2021.
//

import XCTest
@testable import Templars

final class CustomerTest: XCTestCase{
    
    var decoder: JSONDecoder!
    var data: Data!
    
    override func setUp() {
        super.setUp()
        decoder = JSONDecoder()
        let dataString = "{\"id\":\"43fc3382-df49-49cf-ac2d-9405cd595c44\",\"createdAt\":\"2021-01-15T15:35:40.816Z\",\"updatedAt\":\"2021-01-15T15:35:40.816Z\",\"active\":true,\"reference\":\"matthew.chukwuemeka40@gmail.com\"}"
        data = Data(dataString.utf8)
    }
    
    override func tearDown() {
        decoder = nil
        data = nil
        super.tearDown()
    }
    
    func test_json_to_customer_object(){
        do{
            let result = try decoder.decode(Customer.self, from: data)
            XCTAssertEqual(result.id, "43fc3382-df49-49cf-ac2d-9405cd595c44")
        }catch{
            XCTAssert(false)
        }
    }
    
    static let allTests = [
        ("test jsdon yo Customer object", test_json_to_customer_object)
    ]
}

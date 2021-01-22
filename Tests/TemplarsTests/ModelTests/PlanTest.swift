//
//  PlanTest.swift
//  
//
//  Created by Tochi on 21/01/2021.
//

import XCTest
@testable import Templars

final class PlanTest: XCTestCase {
    
    var jsonDecoder: JSONDecoder!
    var data: Data!
    
    
    override func setUp() {
        super.setUp()
        jsonDecoder = JSONDecoder()
        let dataString = "{\"id\":\"5c922de9-f4e5-460f-b48f-1aa5bcbd2011\",\"createdAt\":\"2020-12-03T13:06:07.193Z\",\"updatedAt\":\"2020-12-11T11:01:57.774Z\",\"active\":true,\"name\":\"Diamond plan\",\"amount\":8000,\"description\":\"lorem lovwrweqerfr rwfrefqwfwrtwe rwfwedcqwedqwefwqef qwefqwefqwe qwefqwefqwqfqwefqwe fqwefqwefq wefqwefwef\",\"reference\":\"PLN_2ox4erdgkrcv890\",\"registrations\":2500,\"documents\":2500,\"sessions\":1000,\"interval\":\"monthly\"}"
        data = Data(dataString.utf8)
    }
    
    
    override func tearDown() {
        jsonDecoder = nil
        data = nil
        super.tearDown()
    }
    
    func test_json_to_object_Conversion(){
        do{
            let result = try jsonDecoder.decode(Plan.self, from: data)
            XCTAssertEqual(result.id, "5c922de9-f4e5-460f-b48f-1aa5bcbd2011")

        }catch{
            XCTAssert(false)
        }
    }
    
    static var allTests = [
        ("test json  to Plan object", test_json_to_object_Conversion)
    ]
}

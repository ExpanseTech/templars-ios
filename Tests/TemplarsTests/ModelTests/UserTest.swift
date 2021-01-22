//
//  UserTest.swift
//  
//
//  Created by Tochi on 22/01/2021.
//

import XCTest
@testable import Templars

final class UserTest: XCTestCase{
    
    var decoder: JSONDecoder!
    var data: Data!
    
    override func setUp() {
        super.setUp()
        decoder = JSONDecoder()
        let dataString = "{\"id\":\"661aa7f4-1b88-448f-a9a5-17eef5d2bb7d\",\"createdAt\":\"2021-01-12T10:17:36.037Z\",\"updatedAt\":\"2021-01-12T10:17:36.037Z\",\"active\":true,\"firstName\":\"Matthew\",\"lastName\":\"Chukwuemeka\",\"email\":\"matthew.chukwuemeka40@gmail.com\",\"phoneNumber\":\"+234 815 313 2446\",\"verified\":false,\"role\":\"USER\"}"
        data = Data(dataString.utf8)
    }
    
    override func tearDown() {
        decoder = nil
        data = nil
        super.tearDown()
    }
    
    func test_json_to_user_object_conversion(){
        do{
            let result = try decoder.decode(User.self, from: data)
            XCTAssertEqual(result.id, "661aa7f4-1b88-448f-a9a5-17eef5d2bb7d")
        }catch{
            XCTAssert(false)
        }
    }
}

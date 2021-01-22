//
//  SubscriptionTest.swift
//  
//
//  Created by Tochi on 21/01/2021.
//

import XCTest
@testable import Templars

final class SubscriptionTest: XCTestCase{
    
    var decoder: JSONDecoder!
    var data: Data!
    
    override func setUp() {
        super.setUp()
        decoder = JSONDecoder()
        let dataString = "{\"id\":\"e51475fa-fc29-427f-8609-a3cbca516df0\",\"createdAt\":\"2021-01-14T17:08:36.873Z\",\"updatedAt\":\"2021-01-14T17:08:36.873Z\",\"active\":true,\"amount\":8000,\"reference\":\"T509147675011756\",\"startDate\":\"2021-01-14T17:08:36.858Z\",\"endDate\":\"2021-02-14T17:08:36.858Z\",\"plan\":{\"id\":\"5c922de9-f4e5-460f-b48f-1aa5bcbd2011\",\"createdAt\":\"2020-12-03T13:06:07.193Z\",\"updatedAt\":\"2020-12-11T11:01:57.774Z\",\"active\":true,\"name\":\"Diamond plan\",\"amount\":8000,\"description\":\"lorem lovwrweqerfr rwfrefqwfwrtwe rwfwedcqwedqwefwqef qwefqwefqwe qwefqwefqwqfqwefqwe fqwefqwefq wefqwefwef\",\"reference\":\"PLN_2ox4erdgkrcv890\",\"registrations\":2500,\"documents\":2500,\"sessions\":1000,\"interval\":\"monthly\"}}"
        data = Data(dataString.utf8)
    }
    
    override func tearDown() {
        decoder = nil
        data = nil
        super.tearDown()
    }
    
    func test_data_to_subscription_object(){
        do{
            let result = try decoder.decode(Subscription.self, from: data)
            XCTAssertEqual(result.id, "e51475fa-fc29-427f-8609-a3cbca516df0")
        }catch{
            XCTAssert(false)
        }
    }
    
    static var allTests = [
        ("test json  to Subscription object", test_data_to_subscription_object)
    ]
}

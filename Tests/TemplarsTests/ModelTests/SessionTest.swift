//
//  SessionTest.swift
//  
//
//  Created by Tochi on 22/01/2021.
//

import XCTest
@testable import Templars

final class SessionTest: XCTestCase{
    
    var decoder: JSONDecoder!
    var data1: Data!
    
    override func setUp() {
        super.setUp()
        decoder = JSONDecoder()
        let dataString1 = "{\n        \"title\": \"Hello world\",\n        \"description\": \"Hi\",\n        \"meetingId\": \"96205264053\",\n        \"meetingUrl\": \"https://zoom.us/j/96205264053?pwd=cjZvT21GUUo2Qmk1cjZxZjkrdHVlZz09\",\n        \"startDate\": \"2021-02-15T22:26:56.000Z\",\n        \"endDate\": \"2021-02-15T22:26:56.000Z\",\n        \"count\": 0,\n        \"duration\": 30,\n        \"type\": \"CHAT\",\n        \"status\": \"PENDING\",\n        \"payment\": null,\n        \"customer\": {\n            \"id\": \"43fc3382-df49-49cf-ac2d-9405cd595c44\",\n            \"createdAt\": \"2021-01-15T15:35:40.816Z\",\n            \"updatedAt\": \"2021-01-15T15:35:40.816Z\",\n            \"active\": true,\n            \"reference\": \"matthew.chukwuemeka40@gmail.com\"\n        },\n        \"subscription\": {\n            \"id\": \"e51475fa-fc29-427f-8609-a3cbca516df0\",\n            \"createdAt\": \"2021-01-14T17:08:36.873Z\",\n            \"updatedAt\": \"2021-01-14T17:08:36.873Z\",\n            \"active\": true,\n            \"amount\": 8000,\n            \"reference\": \"T509147675011756\",\n            \"startDate\": \"2021-01-14T17:08:36.858Z\",\n            \"endDate\": \"2021-02-14T17:08:36.858Z\",\n            \"plan\": {\n                \"id\": \"5c922de9-f4e5-460f-b48f-1aa5bcbd2011\",\n                \"createdAt\": \"2020-12-03T13:06:07.193Z\",\n                \"updatedAt\": \"2020-12-11T11:01:57.774Z\",\n                \"active\": true,\n                \"name\": \"Diamond plan\",\n                \"amount\": 8000,\n                \"description\": \"lorem lovwrweqerfr rwfrefqwfwrtwe rwfwedcqwedqwefwqef qwefqwefqwe qwefqwefqwqfqwefqwe fqwefqwefq wefqwefwef\",\n                \"reference\": \"PLN_2ox4erdgkrcv890\",\n                \"registrations\": 2500,\n                \"documents\": 2500,\n                \"sessions\": 1000,\n                \"interval\": \"monthly\"\n            }\n        },\n        \"user\": {\n            \"id\": \"661aa7f4-1b88-448f-a9a5-17eef5d2bb7d\",\n            \"createdAt\": \"2021-01-12T10:17:36.037Z\",\n            \"updatedAt\": \"2021-01-12T10:17:36.037Z\",\n            \"active\": true,\n            \"firstName\": \"Matthew\",\n            \"lastName\": \"Chukwuemeka\",\n            \"email\": \"matthew.chukwuemeka40@gmail.com\",\n            \"phoneNumber\": \"+234 815 313 2446\",\n            \"verified\": false,\n            \"role\": \"USER\"\n        },\n        \"completionDate\": null,\n        \"id\": \"38c491d9-5f89-4c16-a387-608bdc449f6d\",\n        \"createdAt\": \"2021-01-18T11:04:14.626Z\",\n        \"updatedAt\": \"2021-01-18T11:04:14.626Z\",\n        \"active\": true,\n        \"reschedules\": 0\n    }"
        data1 = Data(dataString1.utf8)
    }
    
    override func tearDown() {
        decoder = nil
        data1 = nil
        super.tearDown()
    }
    
    func test_json_to_session_object_coversion(){
        do{
            let result = try decoder.decode(Session.self, from: data1)
            XCTAssertEqual(result.id, "38c491d9-5f89-4c16-a387-608bdc449f6d")
            print(result)
        }catch{
            print(error.localizedDescription)
            XCTAssert(false)
        }
    }
    
    static let allTests = [
        ("test json to session object", test_json_to_session_object_coversion)
    ]
    
}

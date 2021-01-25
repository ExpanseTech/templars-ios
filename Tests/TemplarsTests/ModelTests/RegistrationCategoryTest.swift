//
//  RegistrationCategoryTest.swift
//  
//
//  Created by Tochi on 22/01/2021.
//

import XCTest
@testable import Templars

    final class RegistrationCategoryTest: XCTestCase{
        
        var decoder: JSONDecoder!
        var data: Data!
        
        override func setUp() {
            super.setUp()
            decoder = JSONDecoder()
            let dataString = "{\"id\":\"3398477d-33a3-4e4c-ba5f-6963d0de09ee\",\"createdAt\":\"2020-10-29T12:49:33.343Z\",\"updatedAt\":\"2021-01-07T20:53:29.826Z\",\"active\":true,\"name\":\"Business Name\",\"slug\":\"business-name\",\"description\":null,\"public\":false,\"template\":\"{\\\"id\\\":\\\"7e9c9010-dae8-41eb-b29c-c497861e269c\\\",\\\"name\\\":\\\"Business Name\\\",\\\"blocks\\\":[{\\\"id\\\":\\\"7adf618b-1674-4589-93f7-edb36ea479d0\\\",\\\"type\\\":\\\"inline\\\",\\\"editable\\\":true,\\\"data\\\":{\\\"type\\\":\\\"radio\\\",\\\"label\\\":\\\"Company type\\\",\\\"options\\\":[{\\\"id\\\":\\\"4e0715af-7386-4d07-9801-d051ddd18293\\\",\\\"label\\\":\\\"Public company\\\"},{\\\"id\\\":\\\"da51f5b0-a1b3-414e-a0ee-0d3c382d6b32\\\",\\\"label\\\":\\\"Private company\\\"}]}},{\\\"id\\\":\\\"b67f5b05-15fd-4f10-b40e-f29d6aded4b0\\\",\\\"type\\\":\\\"inline\\\",\\\"editable\\\":true,\\\"data\\\":{\\\"type\\\":\\\"text\\\",\\\"default\\\":\\\"Jane doe and sons\\\",\\\"label\\\":\\\"Company name\\\",\\\"tip\\\":\\\"The company name the way you want it to be registered\\\"}},{\\\"id\\\":\\\"fcb72611-47ee-4dd3-a65d-269d1a28da8d\\\",\\\"type\\\":\\\"inline\\\",\\\"editable\\\":true,\\\"data\\\":{\\\"type\\\":\\\"text\\\",\\\"default\\\":\\\"Enter company orientation\\\",\\\"label\\\":\\\"Company orientation\\\"}},{\\\"id\\\":\\\"0c725cb7-1fc4-4671-952a-08b08780ed33\\\",\\\"type\\\":\\\"inline\\\",\\\"editable\\\":true,\\\"data\\\":{\\\"type\\\":\\\"text\\\",\\\"default\\\":\\\"Lorem ipsum dolor sit amet\\\",\\\"label\\\":\\\"Mission statement\\\",\\\"attributes\\\":{\\\"multiline\\\":true}}},{\\\"id\\\":\\\"e2142d68-e4ab-41e4-a888-f0bf7a23dab0\\\",\\\"type\\\":\\\"inline\\\",\\\"editable\\\":true,\\\"data\\\":{\\\"type\\\":\\\"text\\\",\\\"default\\\":\\\"Enter founder(s) separated by commas\\\",\\\"label\\\":\\\"Founder(s) name(s)\\\"}}]}\",\"price\":2000,\"parent\":{\"id\":\"c72c959c-fc20-42e8-aa7e-dc467150c361\",\"createdAt\":\"2020-10-29T12:49:33.310Z\",\"updatedAt\":\"2021-01-07T11:44:34.065Z\",\"active\":true,\"name\":\"Business Registration\",\"slug\":\"business-registration\",\"description\":null,\"public\":false,\"price\":0}}"
            data = Data(dataString.utf8)
        }
        
        override func tearDown() {
            decoder = nil
            data = nil
            super.tearDown()
        }
        
        func test_json_to_registration_category(){
            do{
                let result = try decoder.decode(RegistrationCategory.self, from: data)
                XCTAssertEqual(result.id, "3398477d-33a3-4e4c-ba5f-6963d0de09ee")
            }catch{
                assert(false)
            }
        }
    }

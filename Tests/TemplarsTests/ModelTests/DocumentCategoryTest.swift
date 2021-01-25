//
//  DocumentCategoryTest.swift
//  
//
//  Created by Tochi on 22/01/2021.
//

import XCTest
@testable import Templars

final class DocumentCategoryTest: XCTestCase{
    
    var decoder: JSONDecoder!
    var data1: Data!
    var data2: Data!
    
    override func setUp() {
        super.setUp()
        decoder = JSONDecoder()
        let dataString1 = "{\"id\":\"506c5806-cc9b-4f8b-a83d-81083a3cbc01\",\"createdAt\":\"2020-12-14T09:05:01.061Z\",\"updatedAt\":\"2021-01-07T11:45:23.719Z\",\"active\":true,\"name\":\"Application letter\",\"slug\":\"application-letter\",\"description\":\"Application letter for employment seekers\",\"public\":true,\"price\":500,\"parent\":{\"id\":\"dd8db4aa-c66f-4450-a91b-90050a1648da\",\"createdAt\":\"2020-12-14T09:01:41.901Z\",\"updatedAt\":\"2021-01-07T11:45:29.597Z\",\"active\":true,\"name\":\"Employment\",\"slug\":\"employment\",\"description\":\"Documents needed for employment seekers\",\"public\":true,\"price\":0}}"
        let dataString2 = "{\"id\":\"dd8db4aa-c66f-4450-a91b-90050a1648da\",\"createdAt\":\"2020-12-14T09:01:41.901Z\",\"updatedAt\":\"2021-01-07T11:45:29.597Z\",\"active\":true,\"name\":\"Employment\",\"slug\":\"employment\",\"description\":\"Documents needed for employment seekers\",\"public\":true,\"price\":0,\"parent\":null}"
        data1 = Data(dataString1.utf8)
        data2 = Data(dataString2.utf8)
    }
    
    override func tearDown() {
        decoder = nil
        data1 = nil
        data2 = nil
        super.tearDown()
    }
    
    func test_json_to_document_category_without_parent(){
        do{
            let result = try decoder.decode(DocumentCategory.self, from: data1)
            XCTAssertEqual(result.parent?.id, "dd8db4aa-c66f-4450-a91b-90050a1648da")
        }catch{
            XCTAssert(false)
        }
    }
    
    func test_json_to_document_category_with_parent(){
        do{
            let result = try decoder.decode(DocumentCategory.self, from: data2)
            XCTAssertEqual(result.id, "dd8db4aa-c66f-4450-a91b-90050a1648da")
        }catch{
            XCTAssert(false)
        }
    }
}

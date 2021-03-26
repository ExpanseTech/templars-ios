//
//  FieldTest.swift
//  
//
//  Created by Tochi on 26/03/2021.
//

import Foundation
import XCTest
@testable import Templars


final class FieldTest: XCTestCase{

    var fields: [Field]! = []
    var field: Field!

    override func setUp() {
        super.setUp()
        field = Field(text: "02 28 2019", type: "", dataType: .date, defaultValue: "", label: "", children: nil, editable: true, id: "1234", options: nil, isOrphan: nil, dateTimeFormat: "MM dd yyyy", valueRef: "")

        let field2 = Field(text: "02-28-2019", type: "", dataType: .date, defaultValue: "", label: "", children: nil, editable: true, id: "1234", options: nil, isOrphan: nil, dateTimeFormat: "MM dd yyyy", valueRef: "")

        fields.append(field)
        fields.append(field2)
    }

    override func tearDown() {
        field = nil
        fields = nil
        super.tearDown()
    }

    func test_field_is_valid(){
        let isValid = field.isValid()

        XCTAssert(isValid)
    }

    func test_fiels_is_invalid(){
        let (isvalid, _) = fields.validate()

        XCTAssert(!isvalid)
    }

}

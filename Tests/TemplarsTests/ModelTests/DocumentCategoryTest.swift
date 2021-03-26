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
    var template: String!
    var fields: [Field]!
    
    override func setUp() {
        super.setUp()
        decoder = JSONDecoder()
        template = "{\"title\":\"Application letter\",\"createdAt\":\"2021-01-26T13:41:40.171Z\",\"nodes\":[{\"type\":\"paragraph\",\"children\":[{\"text\":\"To,\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"editable\",\"dataType\":\"text\",\"defaultValue\":\"Recipient name\",\"label\":\"What is the name of the person who the letter should be addressed to?\",\"children\":[{\"text\":\"\"}],\"editable\":true,\"id\":\"9912b124-9704-4f8f-ae2a-b9644c7e1369\"},{\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"editable\",\"dataType\":\"text\",\"defaultValue\":\"Recipient role\",\"label\":\"What role does this recipient hold?\",\"children\":[{\"text\":\"\"}],\"editable\":true,\"id\":\"71d203d9-8c65-4a90-9471-e0436a11a695\"},{\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"editable\",\"dataType\":\"text\",\"defaultValue\":\"Company name\",\"label\":\"What is the name of the company?\",\"children\":[{\"text\":\"\"}],\"editable\":true,\"id\":\"dbc09501-daf8-48d4-88d6-e6823e397fb8\"},{\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"editable\",\"dataType\":\"text\",\"defaultValue\":\"Company address\",\"label\":\"What is the address of the company?\",\"children\":[{\"text\":\"\"}],\"editable\":true,\"id\":\"a71e00ba-861d-4b49-97d6-5c93bdeb62fe\"},{\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"editable\",\"dataType\":\"date\",\"defaultValue\":\"Application date\",\"dateTimeFormat\":\"MMMM dd, yyyy\",\"label\":\"What date should the application be dated?\",\"children\":[{\"text\":\"\"}],\"editable\":true,\"id\":\"341bd314-aead-441d-847f-8ea7d17c22bb\"},{\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"I learned of the position of \"},{\"type\":\"editable\",\"dataType\":\"text\",\"defaultValue\":\"Job role name\",\"label\":\"What role are you applying to?\",\"children\":[{\"text\":\"\"}],\"editable\":true,\"id\":\"cff3cb95-7356-4397-a493-919219153e57\"},{\"text\":\" at \"},{\"type\":\"editable\",\"dataType\":\"text\",\"defaultValue\":\"Company name\",\"valueRef\":\"dbc09501-daf8-48d4-88d6-e6823e397fb8\",\"children\":[{\"text\":\"\"}],\"editable\":true,\"id\":\"9a6cd20b-5326-428a-b33b-91a36b77b20a\"},{\"text\":\" through the advertisement published by your organisation in the May 3rd edition of the Daily News and I believe that I have the necessary credentials for this role.\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"I have considerable experience working as a \",\"ref\":{\"parent\":\"274891e5-6aee-46f8-b97e-9d2c571a07f2\",\"value\":\"b21fedfb-0caf-4272-9f1b-5d1a7f533da3\"}},{\"type\":\"editable\",\"dataType\":\"text\",\"defaultValue\":\"Job role name\",\"valueRef\":\"cff3cb95-7356-4397-a493-919219153e57\",\"children\":[{\"text\":\"\"}],\"editable\":true,\"id\":\"65567f91-66aa-4277-a228-bc30f7654bb7\",\"ref\":{\"parent\":\"274891e5-6aee-46f8-b97e-9d2c571a07f2\",\"value\":\"b21fedfb-0caf-4272-9f1b-5d1a7f533da3\"}},{\"text\":\". \",\"ref\":{\"parent\":\"274891e5-6aee-46f8-b97e-9d2c571a07f2\",\"value\":\"b21fedfb-0caf-4272-9f1b-5d1a7f533da3\"}},{\"text\":\"I also hold a degree in Electronic Engineering from BITS Pilan. I enclose the following relevant documentation to support my application, along with a reference letter from my previous employer.\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"I would welcome the opportunity to discuss my ability with you for this position in person. I would be grateful if you could take out time from your busy schedule. Please let me know if I can provide you with any further information. Thank you for your kind consideration and hope to hear from you soon.\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"Thanking you,\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"Yours truly,\"}]},{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"editable\",\"dataType\":\"text\",\"defaultValue\":\"Applicant name\",\"label\":\"What is the full name of the applicant?\",\"children\":[{\"text\":\"\"}],\"editable\":true,\"id\":\"dfc76195-74c9-4e13-8355-c2dd932e4799\"},{\"text\":\"\"}]}],\"orphans\":[{\"type\":\"editable\",\"dataType\":\"options\",\"defaultValue\":\"Choose experience\",\"options\":[{\"id\":\"b21fedfb-0caf-4272-9f1b-5d1a7f533da3\",\"label\":\"Yes\"},{\"id\":\"70e211d1-6e69-4696-b94a-615737c4c950\",\"label\":\"No\"}],\"label\":\"Do you have working experience in this role?\",\"children\":[{\"text\":\"\"}],\"isOrphan\":true,\"editable\":true,\"id\":\"274891e5-6aee-46f8-b97e-9d2c571a07f2\"}]}"
        
    }
    
    override func tearDown() {
        decoder = nil
        super.tearDown()
    }
    
    func test_json_to_document_category_without_parent(){
        var fields: [Field] = []
        
        if let data = template?.data(using: .utf8){
            do {
                let template = try JSONDecoder().decode(Template.self, from: data)
                    if let nodes = template.nodes{
                        fields.append(contentsOf: Field.getEditableFields(fields: nodes))
                    }
                    if let orphans = template.orphans {
                        fields.append(contentsOf: Field.getEditableFields(fields: orphans))
                    }
            } catch {
                print(error)
            }
        }
        
        XCTAssert(fields.count > 0)
    }
    
    func test_Forms_List_to_String(){
        
        XCTAssert(true)
    }
    
}

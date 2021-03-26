//
//  File.swift
//  
//
//  Created by Tochi on 05/03/2021.
//

import Foundation

public struct Template: Decodable{
    let title: String
    let createdAt: String
    let nodes: [Field]?
    let orphans: [Field]?
}

public struct Field: Hashable{
    public static func == (lhs: Field, rhs: Field) -> Bool {
        lhs.id == rhs.id
    }

    public var text: String?
    public var type: String?
    public var dataType: DataType?
    public var defaultValue: String?
    public var label: String?
    public var children: [Field]?
    public var editable: Bool?
    public var id: String?
    public var options: [Option]?
    public var isOrphan: Bool?
    public var dateTimeFormat: String?
    public var valueRef: String?
    
    public struct Option: Codable, Hashable {
        let id: String
        let label: String
    }
    
    public enum DataType: String{
        case text = "text"
        case options = "options"
        case radio = "radio"
        case time = "time"
        case date = "date"
        case image = "image"
    }
    
    public enum CodingKeys: String, CodingKey{
        case text
        case type = "type"
        case dataType
        case defaultValue
        case label
        case children
        case editable
        case id
        case options
        case isOrphan
        case dateTimeFormat
        case valueRef
    }

    func isValid() -> Bool{
        if let text = text,
           let dateTimeFormat = dateTimeFormat,
           let dataType = dataType, dataType == .date{

            let dateFormater = DateFormatter()
            dateFormater.dateFormat = dateTimeFormat
            if dateFormater.date(from: text) != nil{
                return true
            }else{
                return false
            }
        }
        return true
    }

}

extension Field: Decodable{
    public init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        
        text = try value.decodeIfPresent(String.self, forKey: .text)
        type = try value.decodeIfPresent(String.self, forKey: .type)
        defaultValue = try value.decodeIfPresent(String.self, forKey: .defaultValue)
        label = try value.decodeIfPresent(String.self, forKey: .label)
        children  = try value.decodeIfPresent([Field].self, forKey: .children)
        editable = try value.decodeIfPresent(Bool.self, forKey: .editable)
        id = try value.decodeIfPresent(String.self, forKey: .id)
        options = try value.decodeIfPresent([Option].self, forKey: .options)
        isOrphan = try value.decodeIfPresent(Bool.self, forKey: .isOrphan)
        dateTimeFormat = try value.decodeIfPresent(String.self, forKey: .dateTimeFormat)
        valueRef = try value.decodeIfPresent(String.self, forKey: .valueRef)
        let dataTypeString = try value.decodeIfPresent(String.self, forKey: .dataType)
        if let dataTypeString = dataTypeString{
            dataType = DataType(rawValue: dataTypeString)
        }else{
            dataType = nil
        }
        
    }
}

public extension Field{
    static func getEditableFields(fields: [Field]) -> [Field]{
        var form: [Field] = []
        for field in fields{
            if let children = field.children, !children.isEmpty{
                if let isEditable = field.editable, isEditable {
                    form.append(field)
                }
                form.append(contentsOf: getEditableFields(fields: children))
            }else{
                if let isEditable = field.editable, isEditable {
                    form.append(field)
                }
            }
        }
        return form
    }
}

extension Array where Element == Field{
    public var dictionary: [String: String]{
        var dict: [String: String] = [:]
        for field in self {
            if let id = field.id, let text = field.text{
                dict[id] = text
            }
        }
        return dict
    }

    public var jsonString: String?{
        if let theJSONData = try?  JSONSerialization.data(
              withJSONObject: dictionary,
              options: .prettyPrinted
              ),
              let theJSONText = String(data: theJSONData,
                                       encoding: String.Encoding.ascii) {
                  return theJSONText
            }
        return nil
    }

    public func validate() -> (Bool, String?) {

//        self.forEach { (field) in
//            let valid = field.isValid()
//            if !field.isValid(){
//                return //(false, "\(field.id ?? ""): value not valid")
//            }
//        }

        for field in self{
            let valid = field.isValid()
            if !field.isValid(){
                return (false, "\(field.id ?? ""): value not valid")
            }
        }

        return (true, nil)
    }
}

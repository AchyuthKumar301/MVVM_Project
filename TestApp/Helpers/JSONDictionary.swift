//
//  JSONDictionary.swift
//  TestApp
//
//  Created by G Achyuth Kumar on 13/02/24.
//

import Foundation

typealias JSONDictionary = [String: Any]
typealias JSONDictionaryArray = [[String: Any]]


extension JSONDictionary {
    
    func arrayValue(_ key: String) -> JSONDictionaryArray {
        if let value = self[key] as? JSONDictionaryArray {
            return value
        } else {
            return []
        }
    }
    
    func intValue(_ key: String) -> Int {
        if let value = self[key] as? Int {
            return value
        } else {
            return 0
        }
    }
    
    func stringValue(_ key: String) -> String {
        if let value = self[key] as? String {
            return value
        } else {
            return ""
        }
    }
}

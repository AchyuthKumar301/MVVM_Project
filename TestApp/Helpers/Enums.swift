//
//  Enums.swift
//  TestApp
//
//  Created by G Achyuth Kumar on 13/02/24.
//

import Foundation

enum ApiKey {
    
    static let total = "total"
    static let hits = "hits"
    static let totalHits = "totalHits"
    static let id = "id"
    static let pageURL = "pageURL"
    static let previewURL = "previewURL"
    static let tags = "tags"
    static let type = "type"
}

enum AppMsg {
    static let unknownError = "Unknown error"
    static let parsingFailed = "Failed to decode response"
}

//
//	SMBaseHit.swift
//  TestApp
//
//  Created by G Achyuth Kumar on 13/02/24.
//

import Foundation

struct SMBaseHit {

	let hits : [SMHit]
	let total : Int
	let totalHits : Int

    init() {
        self.init(fromDictionary: JSONDictionary())
    }
    
	init(fromDictionary dictionary: JSONDictionary) {
        hits = dictionary.arrayValue(ApiKey.hits).map {
            SMHit(fromDictionary: $0)
        }
        total = dictionary.intValue(ApiKey.total)
        totalHits = dictionary.intValue(ApiKey.totalHits)
	}
}

struct SMHit {

	let idField : Int
	let pageURL : String
	let previewURL : String
	let tags : String
	let type : String

    init() {
        self.init(fromDictionary: JSONDictionary())
    }
    
	init(fromDictionary dictionary: JSONDictionary) {
        idField = dictionary.intValue(ApiKey.id)
        pageURL = dictionary.stringValue(ApiKey.pageURL)
        previewURL = dictionary.stringValue(ApiKey.previewURL)
        tags = dictionary.stringValue(ApiKey.tags)
        type = dictionary.stringValue(ApiKey.type)
	}
}


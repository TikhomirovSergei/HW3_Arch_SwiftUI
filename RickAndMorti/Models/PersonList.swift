//
// PersonList.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct PersonList: Codable {

    public var info: Info?
    public var results: [Person]?

    public init(info: Info?, results: [Person]?) {
        self.info = info
        self.results = results
    }


}


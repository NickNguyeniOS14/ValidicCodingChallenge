//
//  Model.swift
//  Validic
//
//  Created by Nick Nguyen on 4/23/21.
//

import Foundation

struct Job: Codable {
    let id: String
    let company: String
}

class DataStore {
    lazy var programmingLanguages = ["Java","C#","Python","Swift","Objective-C","Ruby","Kotlin","Go","C++","Scala"]

    lazy var data: [String: [String]] = ["Boston": programmingLanguages,
                                         "San Francisco": programmingLanguages,
                                         "Los Angeles": programmingLanguages,
                                         "Denver": programmingLanguages,
                                         "Boulder": programmingLanguages,
                                         "Chicago": programmingLanguages,
                                         "New York": programmingLanguages,
                                         "Raleigh": programmingLanguages]
     var cities: [String] {
        return data.map { $0.key }
    }
}

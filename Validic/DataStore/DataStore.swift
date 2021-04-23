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
                                         "SanFrancisco": programmingLanguages,
                                         "LosAngeles": programmingLanguages,
                                         "Denver": programmingLanguages,
                                         "Boulder": programmingLanguages,
                                         "Chicago": programmingLanguages,
                                         "NewYork": programmingLanguages,
                                         "Raleigh": programmingLanguages]
    var cities: [String] {
        return data.map { $0.key }
    }
}

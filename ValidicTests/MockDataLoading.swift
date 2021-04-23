//
//  MockDataLoading.swift
//  ValidicTests
//
//  Created by Nick Nguyen on 4/23/21.
//

import Foundation
@testable import Validic

class MockDataLoader: NetworkDataLoader {

    func loadData(using request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.005) {
            completion(self.data,self.response,self.error)
        }
    }

    let data : Data?
    let response: URLResponse?
    let error: Error?

    internal init(data: Data?,response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
}

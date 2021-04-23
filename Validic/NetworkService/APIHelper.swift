//
//  APIHelper.swift
//  Validic
//
//  Created by Nick Nguyen on 4/23/21.
//

import Foundation

protocol NetworkDataLoader {
    func loadData(using request: URLRequest, completion: @escaping (Data?,URLResponse?,Error?) -> Void )
}

extension URLSession: NetworkDataLoader {
    func loadData(using request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {

        dataTask(with: request) { (data, response, error) in
            completion(data,response,error)
        }.resume()
    }
}

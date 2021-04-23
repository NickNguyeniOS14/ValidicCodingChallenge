//
//  NetworkService.swift
//  Validic
//
//  Created by Nick Nguyen on 4/23/21.
//

import Foundation

class NetworkService {

    private let dataLoader: NetworkDataLoader

    var jobs: [Job] = []

    static let shared = NetworkService()

    init(dataLoader: NetworkDataLoader = URLSession.shared) {
        self.dataLoader = dataLoader
    }

    func getJobsPercentage(language: String, city: String, completion: @escaping ([Job],Error?) -> Void)  {
        let endpoint = "https://jobs.github.com/positions.json?description=\(language.lowercased())&location=\(city.lowercased())"

        let url = URL(string: endpoint)!

        let urlRequest = URLRequest(url: url)

        dataLoader.loadData(using: urlRequest) { (data, _, _) in
            guard let data = data else {
                return
            }
            do {
                let jobs = try JSONDecoder().decode([Job].self, from: data)
                self.jobs = jobs
                DispatchQueue.main.async {
                    completion(jobs, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion([],error)
                }
            }
        }
    }
}

//
//  ViewController.swift
//  Validic
//
//  Created by Nick Nguyen on 4/23/21.
//

import UIKit

class JobsTableViewController: UITableViewController {

    lazy var languages = ["Java","C#","Python","Swift","Objective-C","Ruby","Kotlin","Go","C++","Scala"]

    lazy var cities: [String: [String]] = ["Boston": languages,
                                           "San Francisco": languages,
                                           "Los Angeles": languages,
                                           "Denver": languages,
                                           "Boulder": languages,
                                           "Chicago": languages,
                                           "New York": languages,
                                           "Raleigh": languages]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.keys.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let city = cities.map { $0.key }
        cell.textLabel?.text = city[indexPath.row]
        return cell

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let languages = cities.map { $0.value }
        let arrayLanguage = (languages[indexPath.row])
        arrayLanguage.forEach { (aString) in
            print(aString)
        }
    }

}


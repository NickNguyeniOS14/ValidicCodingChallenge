//
//  ViewController.swift
//  Validic
//
//  Created by Nick Nguyen on 4/23/21.
//

import UIKit

class JobsTableViewController: UITableViewController {

    // MARK: - Properties

    let dataStore = DataStore()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Validic"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.cellID)
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table View Data Source & Delegate

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.cellID, for: indexPath)

        cell.textLabel?.text = dataStore.cities[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let languages = dataStore.data.map{ $0.value }[indexPath.row]

        let selectedCity = dataStore.cities[indexPath.row]

        let detailVC = DetailViewController(languages: languages, city: selectedCity)

        navigationController?.pushViewController(detailVC, animated: true)
    }
}


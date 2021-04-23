//
//  DetailViewController.swift
//  Validic
//
//  Created by Nick Nguyen on 4/23/21.
//

import UIKit

class DetailViewController: UITableViewController {

    // MARK: - Properties

    let languages: [String]
    let city: String
    let tableViewCellID = "TableViewCell"

    // MARK: - Initialization

    init(languages: [String], city: String) {
        self.languages = languages
        self.city = city
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        title = city
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableViewCellID)
    }

    // MARK: - Table View DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellID, for: indexPath)

        let language = languages[indexPath.row]

        NetworkService.shared.getJobsPercentage(language: language, city: city) { (jobs, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            // TODO: Calculate to percentage
            DispatchQueue.main.async {
                cell.textLabel?.text = "\(language):    \(jobs.count) jobs."
            }
        }
        return cell
    }
}

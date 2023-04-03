//
//  RegionListViewController.swift
//  CountryQuiz
//
//  Created by Bektemur Mamashayev on 01/04/23.
//

import UIKit

final class RegionListViewController: UITableViewController {
    private let networkManager = NetworkManager.shared
    var countries: [Country] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        countries = networkManager.getData(for: .Worldwide)
    }
}

//MARK: - Private Methods
extension RegionListViewController {
}

// MARK: - Table view data source
extension RegionListViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        let countryName = countries[indexPath.row].name
        let code = countries[indexPath.row].alpha2Code.lowercased()
        var content = cell.defaultContentConfiguration()
        content.text = countryName
        content.image = UIImage(named: code)
        content.imageProperties.maximumSize.width = 60
        content.imageProperties.cornerRadius = tableView.rowHeight / 2

        cell.contentConfiguration = content
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

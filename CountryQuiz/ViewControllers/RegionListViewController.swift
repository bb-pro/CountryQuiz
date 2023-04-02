//
//  RegionListViewController.swift
//  CountryQuiz
//
//  Created by Bektemur Mamashayev on 01/04/23.
//

import UIKit

final class RegionListViewController: UITableViewController {
    private let networkManager = NetworkManager.shared
    var flags: [Flag] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }
}

//MARK: - Private Methods
extension RegionListViewController {
    func updateData() {
        let countries = networkManager.getData(for: .Worldwide)
        countries.forEach { country in
            flags.append(
                Flag(name: country.name,code: country.alpha2Code.lowercased()))
        }
    }
}

// MARK: - Table view data source
extension RegionListViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let flag = flags[indexPath.row]
        content.text = flag.name
        content.image = UIImage(named: flag.code)
        cell.contentConfiguration = content
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

}

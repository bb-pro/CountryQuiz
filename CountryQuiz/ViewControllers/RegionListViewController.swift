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
    var flags: [Flag] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }
}

//MARK: - Private Methods
extension RegionListViewController {
    private func updateData() {
        countries = networkManager.getData(for: .Worldwide)
        
        updateFlagData()
    }
    private func updateFlagData(){
        countries.forEach { country in
            flags.append(Flag(name: country.name, code: country.alpha2Code.lowercased()))
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
        countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        let countryName = flags[indexPath.row].name
        let code = flags[indexPath.row].code
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

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
        title = "Countries"
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? CountryInfoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailVC.flag = flags[indexPath.row]
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryCell
        let countryName = flags[indexPath.row].name
        let code = flags[indexPath.row].code
        cell.countryName.textColor = .white
        cell.countryName.text = countryName
        cell.flagImage.image = UIImage(named: code)
        cell.flagImage.layer.cornerRadius = 10
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

//MARK: - UI Table View Delegate
extension RegionListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

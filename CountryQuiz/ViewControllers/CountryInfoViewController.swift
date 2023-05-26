//
//  CountryInfoViewController.swift
//  CountryQuiz
//
//  Created by Bektemur Mamashayev on 01/04/23.
//

import UIKit

final class CountryInfoViewController: UIViewController {
    
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    var country: Country!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flagImage.image = UIImage(named: country.alpha2Code.lowercased())
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: - UITableViewDataSources
extension CountryInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
            case 0:
                content.text = "Davlat: "
                content.secondaryText = country.name
            case 1:
                content.text = "Region: "
                content.secondaryText = country.region
            case 2:
                content.text = "Sub region:"
                content.secondaryText = country.subregion
            default:
                content.text = "Davlat kodi:"
                content.secondaryText = country.countryCode

        }
       
        cell.contentConfiguration = content
        return cell
    }
}

//MARK: - UITableViewDelegate
extension CountryInfoViewController: UITableViewDelegate {
    
}

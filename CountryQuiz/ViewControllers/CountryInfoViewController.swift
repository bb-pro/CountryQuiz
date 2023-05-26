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
    
    var flag: Flag!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flagImage.image = UIImage(named: flag.code)
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
        return UITableViewCell()
    }
}

//MARK: - UITableViewDelegate
extension CountryInfoViewController: UITableViewDelegate {
    
}

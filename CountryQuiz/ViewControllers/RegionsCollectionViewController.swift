//
//  RegionsCollectionViewController.swift
//  CountryQuiz
//
//  Created by Bektemur Mamashayev on 01/04/23.
//

import UIKit



final class RegionsCollectionViewController: UICollectionViewController {
    private let reuseIdentifier = "region"
    private let networkManager = NetworkManager.shared
    private let regions = Regions.allCases
    override func viewDidLoad() {
        super.viewDidLoad()
        let countries = networkManager.getData(for: .Worldwide)
        print(countries)
    }

}

// MARK: UICollectionViewDataSource
extension RegionsCollectionViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return regions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier,
            for: indexPath) as! RegionsCollectionViewCell
    
        let region = regions[indexPath.item]
        cell.imageView.image = UIImage(named: region.rawValue)
        cell.countryName.text = region.rawValue
    
        return cell
    }
}

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
    private var sortedCountries: [Country]!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let quizVC = segue.destination as? QuizViewController else { return }
        quizVC.countries = sortedCountries
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
        cell.imageView.layer.cornerRadius = 20
        cell.countryName.text = region.rawValue
        return cell
    }
}
//MARK: - UICollectionViewDelegate
extension RegionsCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("IndexPath item \(indexPath.item)")
        switch indexPath.item {
        case 0: sortedCountries = networkManager.getData(for: .Asia)
        case 1: sortedCountries = networkManager.getData(for: .Americas)
        case 2: sortedCountries = networkManager.getData(for: .Europe)
        case 3: sortedCountries = networkManager.getData(for: .Africa)
        default:
            sortedCountries = networkManager.getData(for: .Worldwide)
        }
        performSegue(withIdentifier: "showQuiz", sender: nil)
    }
}

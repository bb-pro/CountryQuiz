//
//  QuizViewController.swift
//  CountryQuiz
//
//  Created by Bektemur Mamashayev on 01/04/23.
//

import UIKit

final class QuizViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var flagButtons: [UIButton]!
    var countries: [Country]!
    private var answerOptions: [Country] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(countries) quiz info screen")
        updateUI()
    }

}

//MARK: - Private Methods
private extension QuizViewController {
    func updateUI() {
        
        for _ in 1...4 {
            if let country = countries.randomElement() {
                print(country)
                answerOptions.append(country)
            }
        }
        
        for (country, button) in zip(answerOptions, flagButtons) {
            button.setTitle(country.name, for: .normal)
        }
        if let correctAnswer = answerOptions.randomElement() {
            imageView.image = UIImage(named: correctAnswer.alpha2Code.lowercased())
        }
        setButtons()
    }
    
    func setButtons() {
        flagButtons.forEach { button in
            button.layer.cornerRadius = 10
            button.backgroundColor = .lightGray
        }
    }
}

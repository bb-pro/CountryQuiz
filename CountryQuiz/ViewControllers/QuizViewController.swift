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

    private var correctFlag = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        checkAnswer(for: sender)
        Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
}

//MARK: - Private Methods
private extension QuizViewController {
    @objc func updateUI() {
        var answerOptions: [Country] = []
        //Getting random country data to display on the screen
        
        for _ in 1...4 {
            answerOptions.append(countries.randomElement()!)
            }
        
        for (button, country) in zip(flagButtons, answerOptions.shuffled()) {
            button.setTitle(country.name, for: .normal)
        }
        
        guard let correctAnswer = answerOptions.randomElement() else { return }
        imageView.image = UIImage(named: correctAnswer.alpha2Code.lowercased())
        correctFlag = correctAnswer.name
        
        setButtons()
        
    }
    //updating button data and image
    func setButtons() {
        flagButtons.forEach { button in
            button.layer.cornerRadius = 10
            button.backgroundColor = .lightGray
        }
    }
    
    func checkAnswer(for sender: UIButton) {
        if let buttonTitle = sender.title(for: .selected) {
            if correctFlag == buttonTitle {
                sender.backgroundColor = .green
            } else {
                sender.backgroundColor = .red
            }
        }
    }
}

//
//  QuizViewController.swift
//  CountryQuiz
//
//  Created by Bektemur Mamashayev on 01/04/23.
//

import UIKit

final class QuizViewController: UIViewController {
    //MARK: - IB Outlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var flagButtons: [UIButton]!
    @IBOutlet var hearts: [UIImageView]!
    @IBOutlet var scoreLabel: UILabel!
    
    //MARK: - Public Properties
    var countries: [Country]!
    
    //MARK: - Private properties
    private var correctFlag = ""
    private var scoreCount = 0
    private var heartCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        checkAnswer(for: sender)
        Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @IBAction override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        dismiss(animated: true)
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
            button.backgroundColor = .white
        }
    }
    
    func checkAnswer(for sender: UIButton) {
        if let buttonTitle = sender.title(for: .selected) {
            if correctFlag == buttonTitle {
                scoreCount += 1
                scoreLabel.text = "\(scoreCount)"
                sender.backgroundColor = .green
            } else {
                sender.backgroundColor = .red
                if heartCount < 4 {
                    hearts[heartCount].image = UIImage(systemName: "heart")
                    heartCount += 1
                } else {
                    showAlert(title: "Your score is \(scoreCount)", message: "Ok")
                }
            }
        }
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let navigationController = self.navigationController {
                    navigationController.popViewController(animated: true)
                }
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

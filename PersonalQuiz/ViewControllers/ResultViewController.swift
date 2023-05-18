//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 15.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    
        getAnimal()
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("ResultViewController is deallocated")
    }
    
    private func getAnimal() {
//
//        var dogCount = 0
//        var catCount = 0
//        var rabitCount = 0
//        var turtleCount = 0
//
//        for answer in answersChosen {
//            switch answer.animal {
//            case .dog: dogCount += 1
//            case .cat: catCount += 1
//            case .rabbit: rabitCount += 1
//            default: turtleCount += 1
//            }
//
//        }
//
//        let max = dogCount
//
//        if max < catCount {
//            animalResult(animal: .cat)
//        } else if max < rabitCount {
//            animalResult(animal: .rabbit)
//        } else if max < turtleCount {
//            animalResult(animal: .turtle)
//        } else {
//            animalResult(animal: .dog)
//        }
        var animal = [Animal: Int]()
        for chosen in answersChosen {
            if let count = animal[chosen.animal]{
                animal.updateValue(count + 1, forKey: chosen.animal)
            } else {
                animal[chosen.animal] = 1
            }
        }
        
        var max = 0
        var anim: Animal!
        
        for (animal, count) in animal {
            if max < count {
                max = count
                anim = animal
            }
        }
        animalResult(animal: anim)
    }
    
    private func animalResult(animal: Animal){
        animalLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = "\(animal.definition)"
    }
}

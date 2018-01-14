//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by edan yachdav on 12/24/17.
//  Copyright © 2017 edan yachdav. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing..."
        case .cat:
            return "Mischevious yet mild tempered..."
        case .rabbit:
            return "You love everything thats soft..."
        case .turtle:
            return "You are wise beyond your years..."
        }
    }
}





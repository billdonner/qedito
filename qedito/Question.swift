//
//  Sight.swift
//  iTour
//
//  Created by Paul Hudson on 30/09/2023.
//

import Foundation
import SwiftData

@Model
public class Question {
  public init(question: String, topic: String, hint: String, answers: [String], correct: String, explanation: String? = nil, article: String? = nil, image: String? = nil, id: String, date: Date, aisource: String)//{, _$backingData: any BackingData<Question> = Question.createBackingData())
  {
    self.question = question
    self.topic = topic
    self.hint = hint
    self.answers = answers
    self.correct = correct
    self.explanation = explanation
    self.article = article
    self.image = image
    self.id = id
    self.date = date
    self.aisource = aisource
   // self._$backingData = _$backingData
  }
  
  public let question: String
  public let topic: String
  public let hint:String // a hint to show if the user needs help
  public let answers: [String]
  public let correct: String // which answer is correct
  public let explanation: String? // reasoning behind the correctAnswer
  public let article: String?// URL of article about the correct Answer
  public let image:String? // URL of image of correct Answer
  // these fields are hidden from the ai and filled in by pumper
  public let id:String // can be real uuid
  public let date:Date // hmmm
  public let aisource:String
  
  
}

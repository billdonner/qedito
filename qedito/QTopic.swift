//
//  QTopic.swift
//  qedito
//
//  Created by bill donner on 11/5/23.
//

import SwiftUI
import SwiftData

@Model
public class QTopic {
  var name: String
  var details: String
  var date: Date
  var author: String
  var purpose: String
  var version: String
  var priority: Int
  @Relationship(deleteRule: .cascade) var challenges = [Question]()
  
  public init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2,author:String="",purpose:String="",version:String="") {
    self.name = name
    self.details = details
    self.date = date
    self.priority = priority
    self.author = author
    self.purpose = purpose
    self.version = version
    
  }
}

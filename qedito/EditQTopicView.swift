//
//  AddTopicView.swift
//  qedito
//
//  Created by bill donner on 11/5/23.
//

import SwiftUI
import SwiftData

struct EditQTopicView: View {
    @Bindable var topic: QTopic
    @State private var newSightName = ""

    var body: some View {
      NavigationStack { 
        VStack{
        Text(topic.name == "" ? "New Topic":"Edit Topic \(topic.name)").font(.title)
          Form  {
            
            TextField("Topic Name", text: $topic.name)
            TextField("Details", text: $topic.details, axis: .vertical)
            DatePicker("Date", selection: $topic.date)
            Section("Priority") {
              Picker("Priority", selection: $topic.priority) {
                Text("Meh").tag(1)
                Text("Maybe").tag(2)
                Text("Must").tag(3)
              }
              .pickerStyle(.segmented)
            }
            
            
            HStack {
              TextField("Add question", text: $newSightName)
              
              Button("Add", action: addSight)
            }
          }.padding()
        }.frame(maxHeight:300)
       Text ("Questions:")
        ScrollView {
          ForEach(topic.challenges) { challenge in
            Text(challenge.question)
          }
        }
      }
          .navigationTitle("Edit Topic")
       // .navigationBarTitleDisplayMode(.inline)
    }

    func addSight() {
        guard newSightName.isEmpty == false else { return }

        withAnimation {
          let sight = Question(question: newSightName, topic: "YYYY", hint: "", answers:[ ], correct: "", id:UUID().uuidString, date:Date(), aisource: "ChatGPT-turbo-blah")
          topic.challenges.append(sight)
            newSightName = ""
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: QTopic.self, configurations: config)
        let example = QTopic(name: "Example Destination", details: "Example details go here and will automatically expand vertically as they are edited.")
        return EditQTopicView(topic: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}

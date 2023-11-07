//
//  ContentView.swift
//  qedito
//
//  Created by bill donner on 11/5/23.
//

import SwiftUI
import SwiftData
 
struct ContentView: View {
  @Environment(\.modelContext) var modelContext
  @State private var path = [QTopic]()
  @State private var sortOrder = SortDescriptor(\QTopic.name)
  @State private var searchText = ""
  var body: some View {
    NavigationSplitView {
      QTopicListingView(sort: sortOrder, searchString: searchText)
        .navigationTitle("QandA Maker")
        .navigationDestination(for: QTopic.self, destination: EditQTopicView.init)
        .searchable(text: $searchText)
        .toolbar {
          Button("Add Topic", systemImage: "plus", action: addQTopic)
          
          Menu("Sort", systemImage: "arrow.up.arrow.down") {
            Picker("Sort", selection: $sortOrder) {
              Text("Name")
                .tag(SortDescriptor(\QTopic.name))
              
              Text("Priority")
                .tag(SortDescriptor(\QTopic.priority, order: .reverse))
              
              Text("Date")
                .tag(SortDescriptor(\QTopic.date))
            }
            .pickerStyle(.inline)
          }
        }
    } content: {
      Text("Primary View")
    } detail: {
      Text("Detail View")
    }
  }
  func addQTopic() {
      let destination = QTopic()
      modelContext.insert(destination)
      path = [destination]
  }
}

struct XContentView: View {
    @Environment(\.modelContext) var modelContext

    @State private var path = [QTopic]()
    @State private var sortOrder = SortDescriptor(\QTopic.name)
    @State private var searchText = ""

    var body: some View {
        NavigationStack(path: $path) {
            QTopicListingView(sort: sortOrder, searchString: searchText)
                .navigationTitle("QandA Maker")
                .navigationDestination(for: QTopic.self, destination: EditQTopicView.init)
                .searchable(text: $searchText)
                .toolbar {
                    Button("Add Topic", systemImage: "plus", action: addQTopic)

                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\QTopic.name))

                            Text("Priority")
                                .tag(SortDescriptor(\QTopic.priority, order: .reverse))

                            Text("Date")
                                .tag(SortDescriptor(\QTopic.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }

    func addQTopic() {
        let destination = QTopic()
        modelContext.insert(destination)
        path = [destination]
    }
}

#Preview {
    ContentView()
}

//struct ContentView2: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var qtopics: [QTopic]
//  @State var globalCount = 0
//  @State var addTopicToggle = false
//  func refresh() {
//    globalCount += 1
//  }
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(qtopics) { qtopic in
//                    NavigationLink {
//                      Text("\(qtopic.name)  \(qtopic.date , format: Date.FormatStyle(date: .numeric, time: .standard))")
//                       Text(qtopic.details)
//                    } label: {
//                      HStack {
//                        Text(qtopic.name)
//                        Spacer()
//                        Text(qtopic.date, format: Date.FormatStyle(date: .numeric, time: .standard))
//                      }
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
//            .toolbar {
//                ToolbarItem {
//                  Button(action: {addTopicToggle.toggle()} ){
//                        Label("Add Topic", systemImage: "plus")
//                    }
//                }
//            }
//            .sheet(isPresented: $addTopicToggle) {
//              EditQTopicView()
//            }
//        } detail: {
//          Text(qtopics.count>0 ? "Select a Topic" : "Add a Topic")
//        }
//    }
//
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(qtopics[index])
//            }
//          refresh()
//        }
//    }
//}
// 

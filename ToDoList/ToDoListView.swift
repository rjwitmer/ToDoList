//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Bob Witmer on 2023-07-23.
//

import SwiftUI

struct ToDoListView: View {
    
    var toDos = ["Learn Swift",
                 "Build Apps",
                 "Change The World",
                 "Bring The Awesome",
                 "Change The World"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) {toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }
                    
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}


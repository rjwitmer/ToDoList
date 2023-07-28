//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Bob Witmer on 2023-07-23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var toDosVM = ToDosViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}

//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Bob Witmer on 2023-07-28.
//

import Foundation

class ToDosViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []
    
    init() {
        // Temp Data here. Will eventually load in saved data
        toDos.append(ToDo(item: "Learn Swift"))
        toDos.append(ToDo(item: "Build Apps"))
        toDos.append(ToDo(item: "Change the World!"))
    }
    
    func saveToDo(toDo: ToDo, newToDo: Bool) {
        // If new, append to toDosVM.toDos else update the toDo that was passed in from the List
        if newToDo {
            toDos.append(toDo)
        } else {
            if let index = toDos.firstIndex(where: { $0.id == toDo.id}) {
                toDos[index] = toDo
            }
        }
    }
}

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
        loadData()
    }
    
    func saveToDo(toDo: ToDo) {
        // If new, append to toDosVM.toDos else update the toDo that was passed in from the List
        if toDo.id == nil {
            var newToDo = toDo
            newToDo.id = UUID().uuidString
            toDos.append(newToDo)
        } else {
            if let index = toDos.firstIndex(where: { $0.id == toDo.id}) {
                toDos[index] = toDo
            }
        }
        saveData()
    }
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveToDo(fromOffset: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffset, toOffset: toOffset)
        saveData()
    }
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else {return}
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print("😡 ERROR: Could not load data --> \(error.localizedDescription)")
        }
    }
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos)     // 'try?' means if error is thrown, data is nil
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data --> \(error.localizedDescription)")
        }
    }

}

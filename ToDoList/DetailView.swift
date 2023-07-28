//
//  DetailView.swift
//  ToDoList
//
//  Created by Bob Witmer on 2023-07-23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var toDosVM: ToDosViewModel
    @State var toDo: ToDo
    var newToDo = false
    
    var body: some View {
        List {
            TextField("Enter To Do here", text: $toDo.item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            Toggle("Set Reminder:", isOn: $toDo.reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            DatePicker("Date", selection: $toDo.dueDate)
                .disabled(!toDo.reminderIsOn)
                .listRowSeparator(.hidden)
                .padding(.bottom)
            Text("Notes:")
                .padding(.top)
            TextField("Notes", text: $toDo.notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            Toggle("Completed:", isOn: $toDo.isCompleted)
                .padding(.top)
                .listSectionSeparator(.hidden)
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    // If new, append to toDosVM.toDos else update the toDo that was passed in from the List
                    if newToDo {
                        toDosVM.toDos.append(toDo)
                        dismiss()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(toDo: ToDo())
                .environmentObject(ToDosViewModel())
        }
    }
}

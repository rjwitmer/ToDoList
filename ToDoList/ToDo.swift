//
//  ToDo.swift
//  ToDoList
//
//  Created by Bob Witmer on 2023-07-28.
//

import Foundation

struct ToDo: Identifiable {
    let id = UUID().uuidString
    var item = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)
    var notes = ""
    var isCompleted = false
}

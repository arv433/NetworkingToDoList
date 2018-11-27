//
//  NetworkingToDo.swift
//  ToDoList
//
//  Created by Arvin Zojaji on 2018-11-26.
//  Copyright © 2018 Arvin Zojaji. All rights reserved.
//

import Foundation

struct ToDo {
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    var url: String?
    var priority: Priority?
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func loadSampleTodos() -> [ToDo] {
        let todo1 = ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1", url: nil, priority: nil)
        let todo2 = ToDo(title: "ToDo Two", isComplete: true, dueDate: Date(), notes: "Notes 2", url: nil, priority: nil)
        let todo3 = ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Notes 3", url: nil, priority: nil)

        return [todo1, todo2, todo3]
    }
}

enum Priority {
    case one, two, three
}

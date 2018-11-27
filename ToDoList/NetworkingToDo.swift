//
//  NetworkingToDo.swift
//  ToDoList
//
//  Created by Arvin Zojaji on 2018-11-26.
//  Copyright © 2018 Arvin Zojaji. All rights reserved.
//

import Foundation

struct ToDo: Codable {
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    var url: String?
    var priority: Priority?

    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: ArchiveURL) else { return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    static func loadSampleTodos() -> [ToDo] {
        let todo1 = ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1", url: nil, priority: nil)
        let todo2 = ToDo(title: "ToDo Two", isComplete: true, dueDate: Date(), notes: "Notes 2", url: nil, priority: nil)
        let todo3 = ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Notes 3", url: nil, priority: nil)

        return [todo1, todo2, todo3]
    }
    
    static func saveToDos(_ todos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedToDos = try? propertyListEncoder.encode(todos)
        try? encodedToDos?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
}

enum Priority: Int, Codable {
    case one = 0, two = 1, three = 2
}

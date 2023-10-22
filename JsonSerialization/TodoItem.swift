//
//  TodoItem.swift
//  JsonSerialization
//
//  Created by Ram Jondhale on 22/10/23.
//

import Foundation

struct TodoItem: Codable {
    let id: Int
    let userId: Int
    let title: String
    let completed: Bool
}

//
//  Todo.swift
//  todoappclient
//
//  Created by saibalaji on 22/05/20.
//  Copyright © 2020 saibalaji. All rights reserved.
//

import Foundation

struct Todos: Codable
{
    let items: Array<Todo>
}




struct Todo: Codable
{
    let item: String
    let priority: Int
    
    
    init(priority: Int,item: String)
    {
        self.item = item
        self.priority = priority
    }
    
}

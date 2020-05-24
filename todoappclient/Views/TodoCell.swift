//
//  TodoCell.swift
//  todoappclient
//
//  Created by saibalaji on 22/05/20.
//  Copyright © 2020 saibalaji. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var itemLBL: UILabel!
    
    func updateCell(todo: Todo)
    {
        itemLBL.text = todo.item
        switch todo.priority {
        case 0:
            priorityView.backgroundColor = #colorLiteral(red: 0.7647058964, green: 0.03795668724, blue: 0.1254411873, alpha: 1)
            break
        case 1:
            priorityView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            break
        
        
        default:
           priorityView.backgroundColor = #colorLiteral(red: 0.0383013455, green: 0.7450980544, blue: 0.01166867629, alpha: 1)
    }
    }

    
    
   

}


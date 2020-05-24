//
//  ViewController.swift
//  todoappclient
//
//  Created by saibalaji on 22/05/20.
//  Copyright © 2020 saibalaji. All rights reserved.
//

import UIKit

class TodoVC: UIViewController {

    @IBOutlet weak var todotableview: UITableView!
    @IBOutlet weak var prioritysegment: UISegmentedControl!
    @IBOutlet weak var todoitemtxt: UITextField!
    
    var todos = Array<Todo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        todotableview.delegate = self
        todotableview.dataSource = self
        
        getTodos()
        
     
        
        
    }

    
    
    func getTodos()
    {
        networkservice.sharedobj.getTodos { (todos) in
           self.todos = todos.items
           self.todotableview.reloadData()
        }
        
    }
    
  
    

    @IBAction func addTodo(_ sender: Any) {
        
        guard let todoname = todoitemtxt.text else {
            return
        }
        
        
        
        networkservice.sharedobj.addTodos(sendtodo: Todo(priority:prioritysegment.selectedSegmentIndex,item: todoname)) { (todos) in
            
            self.todos = todos.items
            self.todotableview.reloadData()
            
        }
      
    }
}



extension TodoVC:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  todos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoc", for: indexPath) as! TodoCell
        
        cell.updateCell(todo: todos[indexPath.row])
        
        return cell
        
        
        
    }
}


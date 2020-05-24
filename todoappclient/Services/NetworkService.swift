//
//  NetworkService.swift
//  todoappclient
//
//  Created by saibalaji on 22/05/20.
//  Copyright © 2020 saibalaji. All rights reserved.
//

import Foundation


class networkservice
{
    static let sharedobj = networkservice()
    let urlbase = "http://localhost:3003"
    let addtodourl = "/add"
    
    
    let session = URLSession(configuration: .default)
    
    func getTodos(onSuccess: @escaping (Todos) -> Void)
    {
        let url = URL(string: "\(urlbase)")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
           
            
            
            DispatchQueue.main.async {
                do
                {
                    let items =  try JSONDecoder().decode(Todos.self,from: data!)
                   onSuccess(items)
                    
                }
                    
                catch
                {
                    print(error.localizedDescription)
                }
            }

            
            
        }
        
        task.resume()
        
    }
    
    func addTodos(sendtodo: Todo,onsuccess: @escaping (Todos) -> Void)
    {
        let url = URL(string: "\(urlbase)\(addtodourl)")
        var requests = URLRequest(url: url!)
        requests.httpMethod = "POST"
        requests.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requests.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        do
        {
            let body = try JSONEncoder().encode(sendtodo)
            requests.httpBody = body
            
            let task = session.dataTask(with: requests) { (data, response, error) in
                
                DispatchQueue.main.async {
                    do
                    {
                        let items = try JSONDecoder().decode(Todos.self, from: data!)
                        onsuccess(items)
                    }
                        
                    catch
                    {
                        print("ERROR INSIDE \(error.localizedDescription)")
                    }
                    
                    
                }
               
            }
            
            task.resume()
            
            
            
        }
        
        catch
        {
            print(error.localizedDescription)
        }
        
    }
}

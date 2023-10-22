//
//  NetworkManager.swift
//  JsonSerialization
//
//  Created by Ram Jondhale on 22/10/23.
//

import Foundation

class NetworkManager: ObservableObject {

    func fetchDataWithURL() {
        let urlString = "https://jsonplaceholder.typicode.com/todos/1"
        let url = URL(string: urlString)!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let error {
                print("Request failed \(error)")
            }

            if let response = response as? HTTPURLResponse,
               response.statusCode == 200,
               let data {
                let decoder = JSONDecoder()
                let todoItem = try? decoder.decode(TodoItem.self, from: data)
                print(todoItem ?? "")
            }
        }
        task.resume()
    }

    func postData() {
        let urlString = "https://api-dev-scus-demo.azurewebsites.net/api/User/RegisterUser"
        var urlRequest = URLRequest(url: URL(string: urlString)!)
        urlRequest.httpMethod = "post"
        let dataDictionary = ["name": "Ram", "email":"ramjondhale1@gmail.com", "password":"strong"]
        do {
            let requestBody = try JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        } catch {
            debugPrint(error.localizedDescription)
        }

        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data, data.count > 0 {
                let jsonString = String(data: data, encoding: .utf8)
                debugPrint(jsonString!)
            }
        }
        task.resume()
    }

    func getDataWithURLRequest() {
        let getURL = "https://api-dev-scus-demo.azurewebsites.net/api/User/GetUser"
        var urlRequest = URLRequest(url: URL(string: getURL)!)
        urlRequest.httpMethod = "get"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let response = response as? HTTPURLResponse,
               response.statusCode == 200,
               let data {
                let jsonString = String(data: data, encoding: .utf8)
                debugPrint(jsonString?.debugDescription ?? "")
            }
        }
        task.resume()
    }
}

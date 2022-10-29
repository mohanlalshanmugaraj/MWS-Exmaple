//
//  MWSViewModel.swift
//  SampleProject
//
//  Created by Ajaaypranav R K on 29/10/22.
//

import Foundation
//
//https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline

class MWSViewModel : ObservableObject {
    @Published var mwsList : [MWSModel] = []
    
    func getMWSData () {
        print("getMWSData")
        //var urlRequest : URLRequest =
        let url = URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline")!
        var request = URLRequest(url: url)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: request) {  data, response, error in
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: [])
                print(jsonResponse)
                let newValue = jsonResponse as? [[String:Any]] ?? []
                 
                self.mwsList = MWSModel().getData(data: newValue)
            }
            catch  {
                print("Error: \(error)")
            }
        }
        
        task.resume()
    }
    
}

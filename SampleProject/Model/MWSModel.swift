//
//  MWSModel.swift
//  SampleProject
//
//  Created by Ajaaypranav R K on 29/10/22.
//

import Foundation

class MWSModel : ObservableObject{
    var id : Int = 0
    var brand : String = ""
    var name : String = ""
    var price : Double = 0.00
    var image_link : String = ""
    var description : String = ""
    var rating : Int = 0
    
    init() {
        
    }
    
    
    init(id : Int, brand : String,name : String,price:Double,image_link:String,description: String,rating:Int) {
        self.id = id
        self.brand = brand
        self.name = name
        self.price = price
        self.image_link = image_link
        self.description = description
        self.rating = rating
    }
    
    init(responseData : [String:Any]) {
        self.id = responseData["id"] as? Int ?? 0
        self.brand = responseData["brand"] as? String ?? ""
        self.name = responseData["name"] as? String ?? ""
        self.price = responseData["price"] as? Double ?? 0.00
        self.image_link = responseData["image_link"] as? String ?? ""
        self.description = responseData["description"] as? String ?? ""
        self.rating = responseData["rating"] as? Int ?? 0
    }
    
    func getData(data : [[String:Any]]) -> [MWSModel] {
        var temp : [MWSModel] = []
        for datum in data {
            temp.append(MWSModel(responseData: datum))
        }
        return temp
  }
}

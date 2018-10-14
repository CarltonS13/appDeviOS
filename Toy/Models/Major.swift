//
//  Major.swift
//  Toy
//
//  Created by Carlton Segbefia on 10/6/18.
//  Copyright © 2018 Carlton Segbefia. All rights reserved.
//

import UIKit

class Major: NSObject {
    struct MajorCellInfo {
        let name : String!
        let image: UIImage!
        let population : Int!
        let department : String!
    }
    
    static var count : Int = 0
    static var majors = [MajorCellInfo]()
    
    class func addMajor(name: String! ,image: UIImage!, population: Int!, department : String!) -> Void {
        majors.append(MajorCellInfo(name: name, image: image, population: population, department: department))
        count += 1
    }
    
    class func laodMajors(completion: @escaping (Array<Dictionary<String,String>>) -> Void) -> Void {
    let url = URL(string: "http://carltonsegbefia.com/apps/majors.json");
    let session = URLSession(configuration: .default)
    var request = URLRequest(url: url!)
    request.httpMethod = "GET"
    let task = session.dataTask(with: request) { (data, response, error) in
        if(error != nil){
            print("Failed to get majors from server")
            return
        }
        print("Got majors")
        let result = try? JSONSerialization.jsonObject(with: data!,options: [] ) as! Array<Dictionary<String,String>>
        
        completion(result!)
        
    }
    task.resume()
    }
}

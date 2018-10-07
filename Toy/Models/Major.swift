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
}

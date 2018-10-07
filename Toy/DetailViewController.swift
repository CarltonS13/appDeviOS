//
//  DetailViewController.swift
//  Toy
//
//  Created by Carlton Segbefia on 10/6/18.
//  Copyright © 2018 Carlton Segbefia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var name : String! = ""
    var population : String! = ""
    var department : String! = ""
    var image : UIImage!
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PopulationLabel: UILabel!
    @IBOutlet weak var DepartmentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameLabel.text =  name
        PopulationLabel.text = population
        DepartmentLabel.text = department
        ImageView.image = image
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

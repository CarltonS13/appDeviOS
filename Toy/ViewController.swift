//
//  ViewController.swift
//  Toy
//
//  Created by Carlton Segbefia on 9/28/18.
//  Copyright © 2018 Carlton Segbefia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var submitted : Bool = false

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var NameTextField: UITextField!
    
    
    @IBOutlet weak var MajorLabel: UILabel!
    @IBOutlet weak var MajorTextField: UITextField!
    
    @IBOutlet weak var SubmitButton: UIButton!
    
    @IBOutlet weak var DisplayLabel: UILabel!
    
    func show() {
        NameLabel.isHidden = false
        MajorLabel.isHidden = false
        NameTextField.isHidden = false
        MajorTextField.isHidden = false
        DisplayLabel.isHidden = true
        

        SubmitButton.setTitle("Declare", for: .normal)
        
        submitted.toggle()
    }
    
    func hide() {
        NameLabel.isHidden = true
        MajorLabel.isHidden = true
        NameTextField.isHidden = true
        MajorTextField.isHidden = true
        
        
        NameTextField.text = ""
        MajorTextField.text = ""
        DisplayLabel.isHidden = false
        
        SubmitButton.setTitle("Drop", for: .normal)
        
        submitted.toggle()
    }
    
    @IBAction func SubmitButtonTapped(_ sender: Any) {
        if (submitted) {
       
            
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.removeObject(forKey: "major")
            
                 show()
        }else{
           
            
            let name = NameTextField.text ?? ""
            let major = MajorTextField.text ?? ""
            
            DisplayLabel.text = "Welcome to the " + major + " department " + name + "!";

            UserDefaults.standard.set(name, forKey: "name")
            UserDefaults.standard.set(major, forKey: "major")
            
             hide()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(UserDefaults.standard.object(forKey: "name") != nil){
            hide()
            let name = UserDefaults.standard.string(forKey: "name")
            let major = UserDefaults.standard.string(forKey: "major")
            DisplayLabel.text = "Welcome to the " + major! + " department " + name! + "!";
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}


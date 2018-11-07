import UIKit

extension UIViewController{
    func dismissKeyboardTaps() {
         let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(false)
    }
   
}

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
        dismissKeyboardTaps()
        if(UserDefaults.standard.object(forKey: "name") != nil){
            hide()
            let name = UserDefaults.standard.string(forKey: "name")
            let major = UserDefaults.standard.string(forKey: "major")
            DisplayLabel.text = "Welcome to the " + major! + " department " + name! + "!";
        }
        
        if (Major.count == 0 ){
            
            Major.laodMajors{ (result) in
                for dict in result {
                let imageURL = URL(string: dict["Image"]!)
                let image = UIImage(data: try! Data(contentsOf: imageURL!))
                Major.addMajor(name: dict["Name"]!, image: image, population: Int(dict["Population"]!), department: dict["Department"]!)
            }
            }

        }
        
    }


}


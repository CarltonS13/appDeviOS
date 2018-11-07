import UIKit

var department : String = ""
var major : String = ""
var population : Int? = 0

class AddMajorTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
    var addMajorViewController : AddMajorViewController? = nil

    @IBOutlet weak var TextView: UITextView!
    
    @IBOutlet weak var PickerView: UIPickerView!
    
    func canSubmit() -> Bool {
        return population != 0 && major != "" && department != ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        PickerView.delegate = self
        PickerView.dataSource = self
        TextView.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: - Picker View Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 1:
            return "Science Department"
        case 2:
            return "Math Department"
        case 3:
            return "Art Department"
        case 4:
            return "Humanities Department"
        default:
            return "General Department"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 1:
            department = "Science Department"
        case 2:
            department = "Math Department"
        case 3:
            department = "Art Department"
        case 4:
            department = "Humanities Department"
        default:
            department = "General Department"
        }
        
//        pickerView.isHidden = true;
        addMajorViewController?.TableView.reloadRows(at: [IndexPath (row: 0, section: 1)], with: .automatic)
        
        if (canSubmit()){
            addMajorViewController?.DoneButton.isEnabled = true
        }
//         addMajorViewController?.TableView.reloadSections(IndexSet.init(integer: 1), with: .automatic)
    }
    
    // MARK: - Text View Methods
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.textColor == UIColor.gray){
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
            if(textView.tag == 0){
                major = textView.text
            }else{
                population = Int(textView.text)
            }
        if (canSubmit()){
            addMajorViewController?.DoneButton.isEnabled = true
        }else {
            addMajorViewController?.DoneButton.isEnabled = false
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if(textView.text == ""){
            if(textView.tag == 0){
                textView.text = "Major"
            }else{
                textView.text = "Population"
            }
            textView.textColor = UIColor.gray
        }
    }

}

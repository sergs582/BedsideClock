
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var SettingsView: UIView!
    
   
    @IBOutlet weak var ColourChangerSeg: UISegmentedControl!
    @IBOutlet weak var BackColourChangerSeg: UISegmentedControl!
    
    @IBOutlet weak var BackStyleChangerSeg: UISegmentedControl!
    @IBOutlet weak var FontChanger: UIStepper!
    @IBOutlet weak var FontSize: UILabel!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        update()
        
        SettingsView.backgroundColor = UIColor.init(red: 60/255, green: 62/255, blue: 66/255, alpha: 0.8)
        SettingsView.layer.cornerRadius = 7
        
        
        
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: (#selector(ViewController.closesettings)))
        
        view.addGestureRecognizer(tap)
        
    
        
    }
    
  @objc  func closesettings(){
        if SettingsView.isHidden == false{
            SettingsView.isHidden = true
             settingsButton.alpha = 0.65
        }
    }
    
    
    @objc func update(){
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .medium
        label.text = timeFormatter.string(from: NSDate() as Date)

        
    }

    @IBAction func SettingsBtn(_ sender: Any) {
        if SettingsView.isHidden == true{
            SettingsView.isHidden = false
            settingsButton.alpha = 1
        }else{
            SettingsView.isHidden = true
            settingsButton.alpha = 0.65
        }
        
    }
    
    @IBAction func ColourChanger(_ sender: Any) {
        
        switch ColourChangerSeg.selectedSegmentIndex {
        case 0:
            label.textColor = UIColor.white
        case 1:
             label.textColor = UIColor.black
        case 2:
            label.textColor = UIColor.green
        case 3:
            label.textColor = UIColor.red
        case 4:
            label.textColor = UIColor.init(red: 242/255, green: 53/255, blue: 226/255, alpha: 1.0)
        default:
            print("error")
        }
        
    }
    
   
    
    @IBAction func BackColorChanger(_ sender: Any) {
        switch BackColourChangerSeg.selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = UIColor.white
        case 1:
            self.view.backgroundColor = UIColor.black
        case 2:
           self.view.backgroundColor = UIColor.green
        case 3:
           self.view.backgroundColor = UIColor.red
        case 4:
            self.view.backgroundColor = UIColor.init(red: 242/255, green: 53/255, blue: 226/255, alpha: 1.0)
        default:
            print("error")
        }
        
        backImage.isHidden = true
        BackStyleChangerSeg.selectedSegmentIndex = 0
        
    }
    
    
    @IBAction func BackStyleChenger(_ sender: Any) {
        switch BackStyleChangerSeg.selectedSegmentIndex {
        case 0:
            backImage.isHidden = true
        case 1:
            backImage.isHidden = false
            backImage.image = UIImage(named: "Background1")
        case 2:
            backImage.isHidden = false
            backImage.image = UIImage(named: "Background2")
        case 3:
            backImage.isHidden = false
            backImage.image = UIImage(named: "Background3")
        case 4:
            backImage.isHidden = false
            backImage.image = UIImage(named: "Background4")
        default:
            print("error")
        }
        
    }
    
    
    
    @IBAction func FontChanger(_ sender: Any) {
        label.font = label.font.withSize(CGFloat(Int(FontChanger.value)))
        FontSize.text = "Font size: \(Int(FontChanger.value))"
    }
    
    
    
    
    

}


//
//  SignupViewController.swift
//  Game1
//
//  Created by Chris.Cheng on 19/02/2017.
//  Copyright © 2017 Chris.Cheng. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var originDisplay: UILabel!
    @IBOutlet weak var sexDisplay: UILabel!
    @IBOutlet weak var nameDisplay: UILabel!
    @IBOutlet weak var sexImage2: UIImageView!
    @IBOutlet weak var sexImage1: UIImageView!
    var sex = "male"
    var charactername = ""
    var origin = 1
    @IBOutlet weak var nameText: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(self.nameDisplay != nil) {
            self.nameDisplay.text = self.charactername
        }
        if(self.sexDisplay != nil) {
            self.sexDisplay.text = self.getSex()
        }
        if(self.originDisplay != nil) {
            self.originDisplay.text = self.getOrigin()
        }
        self.view.backgroundColor = UIColor.black
        if UserDefaults.standard.dictionaryRepresentation().keys.contains("characterstate") {
            let alertController = UIAlertController(title: "", message: "发现原先的游戏存档！", preferredStyle: UIAlertControllerStyle.alert)
            
            let Action1 = UIAlertAction(title: "继续游戏", style: .default) { (action) -> Void in
                alertController.dismiss(animated: true, completion: nil)
                OperationQueue.main.addOperation{
                    self.performSegue(withIdentifier: "startGame", sender: self)
                }
            }
            let Action2 = UIAlertAction(title: "重新开始", style: .default) { (action) -> Void in
                alertController.dismiss(animated: true, completion: nil)
                let appDomain = Bundle.main.bundleIdentifier!
                UserDefaults.standard.removePersistentDomain(forName: appDomain)
            }
            alertController.addAction(Action1)
            alertController.addAction(Action2)
            OperationQueue.main.addOperation{
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.setSex1))
        tapGesture1.cancelsTouchesInView = false
        tapGesture1.numberOfTapsRequired = 1
        tapGesture1.numberOfTouchesRequired = 1
        tapGesture1.delegate = self
        if(self.sexImage1 != nil) {
            self.sexImage1.addGestureRecognizer(tapGesture1)
        }
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(self.setSex2))
        tapGesture2.cancelsTouchesInView = false
        tapGesture2.numberOfTapsRequired = 1
        tapGesture2.numberOfTouchesRequired = 1
        tapGesture2.delegate = self
        if(self.sexImage2 != nil) {
            self.sexImage2.addGestureRecognizer(tapGesture2)
        }
    }
    
    @IBAction func setSex2(_ sender: Any) {
        self.sex = "female"
        self.performSegue(withIdentifier: "gettoSignup2", sender: self)
    }
    
    @IBAction func setSex1(_ sender: Any) {
        self.sex = "male"
        self.performSegue(withIdentifier: "gettoSignup2", sender: self)
    }
    
    @IBAction func setOrigin1(_ sender: Any) {
        self.origin = 1
        self.performSegue(withIdentifier: "gettoSignup4", sender: self)
    }
    
    @IBAction func setOrigin2(_ sender: Any) {
        self.origin = 2
        self.performSegue(withIdentifier: "gettoSignup4", sender: self)
    }
    
    @IBAction func setOrigin3(_ sender: Any) {
        self.origin = 3
        self.performSegue(withIdentifier: "gettoSignup4", sender: self)
    }
    
    @IBAction func setOrigin4(_ sender: Any) {
        self.origin = 4
        self.performSegue(withIdentifier: "gettoSignup4", sender: self)
    }
    
    @IBAction func setOrigin5(_ sender: Any) {
        self.origin = 5
        self.performSegue(withIdentifier: "gettoSignup4", sender: self)
    }
    
    @IBAction func setName(_ sender: Any) {
        self.charactername = nameText.text!
        self.performSegue(withIdentifier: "gettoSignup3", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SignupViewController {
            viewController.sex = self.sex
            viewController.charactername = self.charactername
            viewController.origin = self.origin
        }
    }
    
    @IBAction func startGame(_ sender: Any) {
        UserDefaults.standard.set("yes", forKey: "characterstate")
        UserDefaults.standard.set(self.charactername, forKey: "cname")
        UserDefaults.standard.set(self.sex, forKey: "csex")
        UserDefaults.standard.set(self.origin, forKey: "corigin")
        self.performSegue(withIdentifier: "startGame", sender: self)
    }
    
    func getSex() -> String {
        if(self.sex == "male") {
            return "侠客"
        }
        else {
            return "侠女"
        }
    }
    
    func getOrigin() -> String {
        switch self.origin {
        case 1:
            return "你出生在一个武学世家，拥有良好的根基"
        case 2:
            return "你自幼便无父无母，孤苦伶仃"
        case 3:
            return "你出生在一个商贾之家，锦衣玉食，不知世间疾苦"
        case 4:
            return "你出生在一个文学世家，通晓典籍"
        case 5:
            return "你是天帝的子孙，世间万物信手拈来"
        default:
            return "你出生在一个武学世家，拥有良好的根基"
        }
    }
}

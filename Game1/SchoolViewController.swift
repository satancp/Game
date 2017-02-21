//
//  SchoolViewController.swift
//  Game1
//
//  Created by Chris.Cheng on 20/02/2017.
//  Copyright © 2017 Chris.Cheng. All rights reserved.
//

import UIKit

class SchoolViewController: UIViewController {

    @IBOutlet weak var eventButton3: UIButton!
    @IBOutlet weak var eventButton2: UIButton!
    @IBOutlet weak var eventButton1: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.eventButton1.layer.cornerRadius = 5
        self.eventButton1.layer.borderWidth = 1
        self.eventButton1.layer.borderColor = UIColor.yellow.cgColor
        self.eventButton2.layer.cornerRadius = 5
        self.eventButton2.layer.borderWidth = 1
        self.eventButton2.layer.borderColor = UIColor.yellow.cgColor
        self.eventButton3.layer.cornerRadius = 5
        self.eventButton3.layer.borderWidth = 1
        self.eventButton3.layer.borderColor = UIColor.yellow.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

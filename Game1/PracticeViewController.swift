//
//  PracticeViewController.swift
//  Game1
//
//  Created by Chris.Cheng on 20/02/2017.
//  Copyright © 2017 Chris.Cheng. All rights reserved.
//

import UIKit

class PracticeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startP(_ sender: Any) {
        self.performSegue(withIdentifier: "startPractice", sender: self)
    }
    
    @IBAction func dismissSP(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

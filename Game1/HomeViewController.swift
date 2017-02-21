//
//  HomeViewController.swift
//  Game1
//
//  Created by Chris.Cheng on 20/02/2017.
//  Copyright © 2017 Chris.Cheng. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let events = ["闯荡江湖","闭关修炼","村酒野蔬","华山论剑"]
    @IBOutlet weak var eventTable: UITableView!
    
    @IBOutlet weak var backView: UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.eventTable.dataSource = self
        self.eventTable.delegate = self
        self.eventTable.backgroundView = self.backView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableCell
        cell.eventButton.setTitle(self.events[indexPath.row], for: .normal)
        cell.backgroundColor = UIColor.clear
        cell.eventButton.layer.cornerRadius = 5
        cell.eventButton.layer.borderWidth = 1
        cell.eventButton.layer.borderColor = UIColor.yellow.cgColor
        if(indexPath.row == 1) {
            cell.eventButton.addTarget(self, action: #selector(self.checkP), for: .touchDown)
        }
        //cell.eventButton.setImage(UIImage(named:"jianghu"), for: .normal)
        return cell
    }
    
    func checkP() {
        self.performSegue(withIdentifier: "checkPractice", sender: self)
    }
}

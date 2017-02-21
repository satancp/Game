//
//  CharacterViewController.swift
//  Game1
//
//  Created by Chris.Cheng on 19/02/2017.
//  Copyright © 2017 Chris.Cheng. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var attribtueSwitch: UISegmentedControl!
    @IBOutlet weak var attributeCollection: UICollectionView!
    var charactername = ""
    var sex = "male"
    var origin = 1
    var characternickname = "平民百姓"
    @IBOutlet weak var nicknameDisplay: UILabel!
    @IBOutlet weak var nameDisplay: UILabel!
    @IBOutlet weak var sexDisplay: UILabel!
    @IBOutlet weak var groupDisplay: UILabel!
    @IBOutlet weak var expDisplay: UILabel!
    @IBOutlet weak var levelDisplay: UILabel!
    @IBOutlet weak var avatarDisplay: UIImageView!
    let attributeNumber = [5,6,11,14]
    let attributeTitle = ["江湖属性","基本功","武学","技艺"]
    var attributeCurrentHeader = 0
    let attributeCellTitle = [["悟性","道德","声望","魅力","福缘"],["内功","眼功","耳功","软功","硬功","轻功"],["刀法","剑法","棍法","掌法","拳法","指法","腿法","暗器","音律","神功","绝技"],["音乐","棋术","书法","绘画","医术","毒术","铁匠","鉴定","钓鱼","打猎","花卉","茶道","饮酒","厨艺"]]
    let attributeCellValue = [[100,100,100,100,100],[100,100,100,100,100,100],[100,100,100,100,100,100,100,100,100,100,100],[100,100,100,100,100,100,100,100,100,100,100,100,100,100]]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.charactername = UserDefaults.standard.value(forKey:"cname") as! String
        self.sex = UserDefaults.standard.value(forKey:"csex") as! String
        self.origin = UserDefaults.standard.value(forKey:"corigin") as! Int
        self.nameDisplay.text = self.charactername
        self.nicknameDisplay.text = self.characternickname
        self.sexDisplay.text = self.getSex()
        self.attributeCollection.delegate = self
        self.attributeCollection.dataSource = self
        self.attribtueSwitch.addTarget(self, action: #selector(self.segmentedControlValueChanged), for: UIControlEvents.valueChanged)
        self.attributeCurrentHeader = self.attribtueSwitch.selectedSegmentIndex
        self.view.backgroundColor = UIColor.black
        self.tabBarController?.tabBar.barTintColor = UIColor.black
        self.tabBarController?.tabBar.isTranslucent = false
        self.tabBarController?.tabBar.tintColor = nameDisplay.textColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getSex() -> String {
        if(self.sex == "male") {
            self.avatarDisplay.image = UIImage(named:"nan_head1")
            return "侠客"
        }
        else {
            self.avatarDisplay.image = UIImage(named:"nv_head1")
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.attributeNumber[self.attributeCurrentHeader]
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "attributeH", for: indexPath) as! AttributeHeader
        header.attributeHeaderName.text = self.attributeTitle[self.attributeCurrentHeader]
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "attributeC", for: indexPath as IndexPath) as! AttributeCell
        cell.attributeName.text = self.attributeCellTitle[self.attributeCurrentHeader][indexPath.item]
        cell.attributeValue.text = String(self.attributeCellValue[self.attributeCurrentHeader][indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! AttributeCell
    }
    
    func segmentedControlValueChanged() {
        self.attributeCurrentHeader = self.attribtueSwitch.selectedSegmentIndex
        OperationQueue.main.addOperation{
            self.attributeCollection.reloadData()
        }
    }
}

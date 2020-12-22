//
//  NewsDetailViewController.swift
//  TopNews
//
//  Created by Tushar Elangovan on 12/18/20.
//

import UIKit
import Foundation

class NewsDetailViewController: UIViewController {
    var HVC: HomeViewController?

    var cellnumber: Int = 0
    lazy var bgview: UIView = {
        let view = UIView()
         view.backgroundColor = UIColor.white
         view.layer.cornerRadius = 10.0
         return view
    }()
    lazy var Title: UITextView = {
        let label = UITextView()
        label.text = HVC?.article[IndexPath as! Int].title
        label.inputView = UIView()
        label.backgroundColor = UIColor.white
       // label.isUserInteractionEnabled a= false
        label.font = UIFont.boldSystemFont(ofSize: 20)
    //    label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.black
        return label
    }()
    lazy var Author: UILabel = {
        let label = UILabel()
        label.text = "By: \( HVC!.article[IndexPath as! Int].author ?? "Media")"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
        
    }()
    lazy var Description: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.black
        
        return label
    }()
    lazy var Url: UITextField = {
        let label = UITextField()
        label.adjustsFontSizeToFitWidth = true
        label.inputView = UIView()
        label.textColor = UIColor.black
        return label
    }()
    lazy var urlbutton: UIButton = {
       let button = UIButton()
        button.setTitle("Read More", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(url_tapped), for: .touchUpInside)
        return button
    }()
    lazy var Content: UITextView = {
        let label = UITextView()
        label.text = HVC!.article[IndexPath as! Int].content
        label.inputView = UIView()
        label.font = UIFont(name: "Avenir", size: 18)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.systemOrange
        return label
    }()
    var IndexPath = UserDefaults.standard.value(forKey: "indexPath")
    lazy var profileimage: UIImageView = {
        let iv = UIImageView()
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        iv.image = UIImage(url: URL(string: HVC!.article[IndexPath as! Int].urlToImage ?? "https://www.apple.com"))
        iv.backgroundColor = UIColor.blue
        iv.layer.borderWidth = 0.5
       return iv
    }()
    @objc func url_tapped(){
       
        let WVC = WebViewController()
        WVC.NDVC = self
        WVC.modalPresentationStyle = .automatic
        self.present(WVC, animated: true, completion: nil)
    }
    
    func setuplayout(){
        
        view.addSubview(bgview)
        _ = bgview.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: view.frame.width - 10, heightConstant: view.frame.height)
        bgview.addSubview(profileimage)
        _ = profileimage.anchor(top: bgview.topAnchor, left: bgview.leftAnchor, bottom: nil, right: bgview.rightAnchor, topConstant: 10, leftConstant: view.frame.width/4, bottomConstant: 0, rightConstant: view.frame.width/4, widthConstant: view.frame.width/4, heightConstant: view.frame.height/4)
        bgview.addSubview(Title)
        _ = Title.anchor(top: profileimage.bottomAnchor, left: bgview.leftAnchor, bottom: nil, right: bgview.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: view.frame.height/8)
        bgview.addSubview(Author)
        _ = Author.anchor(top: Title.bottomAnchor, left: bgview.leftAnchor, bottom: nil, right: bgview.rightAnchor, topConstant: -5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: view.frame.height/8)
        bgview.addSubview(Content)
        _ = Content.anchor(top: Author.bottomAnchor, left: bgview.leftAnchor, bottom: nil, right: bgview.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: view.frame.height/4)
        bgview.addSubview(urlbutton)
        _ = urlbutton.anchor(top: Content.bottomAnchor, left: bgview.leftAnchor, bottom: nil, right: bgview.rightAnchor, topConstant: view.frame.height/20, leftConstant: view.frame.width/4, bottomConstant: 5, rightConstant: view.frame.width/4, widthConstant: view.frame.width/4, heightConstant: view.frame.height/14)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
  
        setuplayout()
        print("I m Here")
        print(HVC!.article[1].urlToImage!)
        // Do any additional setup after loading the view.
    }
    

}



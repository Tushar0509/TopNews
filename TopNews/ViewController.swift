//
//  ViewController.swift
//  TopNews
//
//  Created by Tushar Elangovan on 12/18/20.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    var apikey = "832c74a7c14b43cfbdb837cf8a0b140c"
    var HVC: HomeViewController?
    lazy var ParsingError: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    lazy var blinker_btn:UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        return button
    }()
    lazy var ctg_label: UILabel = {
        let label = UILabel()
        label.text = "Categories"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    lazy var bitcoin_btn: UIButton = {
       let button = UIButton()
       // button.setTitle(HVC?.article[IndexPath as! Int].url, for: .normal)
        button.setTitle("Bitcoin", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(bitcoin_tapped), for: .touchUpInside)
       // button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    lazy var USB_button: UIButton = {
       let button = UIButton()
       // button.setTitle(HVC?.article[IndexPath as! Int].url, for: .normal)
        button.setTitle("US Business", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(USB_tapped), for: .touchUpInside)
       // button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    lazy var Ind_button: UIButton = {
       let button = UIButton()
       // button.setTitle(HVC?.article[IndexPath as! Int].url, for: .normal)
        button.setTitle("Indian Business", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(IND_tapped), for: .touchUpInside)
       // button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    lazy var Appl_btn: UIButton = {
       let button = UIButton()
       // button.setTitle(HVC?.article[IndexPath as! Int].url, for: .normal)
        button.setTitle("Apple Mentioned", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(apple_tapped), for: .touchUpInside)
       // button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    lazy var Tech_btn: UIButton = {
       let button = UIButton()
       // button.setTitle(HVC?.article[IndexPath as! Int].url, for: .normal)
        button.setTitle("Tech Crunch", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tech_tapped), for: .touchUpInside)
       // button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    lazy var WSJ_btn: UIButton = {
       let button = UIButton()
       // button.setTitle(HVC?.article[IndexPath as! Int].url, for: .normal)
        button.setTitle("Wall Street Journal", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(WSJ_tapped), for: .touchUpInside)
       // button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    @objc func bitcoin_tapped(){
        let TVC = HomeViewController(collectionViewLayout: UICollectionViewFlowLayout())
        TVC.VC = self
        TVC.ctg_label.text = "Bitcoin"
        TVC.category = "everything?q=bitcoin&from=2020-12-31&sortBy=publishedAt"
        //http://newsapi.org/v2/everything?q=bitcoin&from=2020-11-27&sortBy=publishedAt&apiKey=832c74a7c14b43cfbdb837cf8a0b140c
        TVC.modalPresentationStyle = .fullScreen
        self.present(TVC, animated: true, completion: nil)
    }
    @objc func apple_tapped(){
        let TVC = HomeViewController(collectionViewLayout: UICollectionViewFlowLayout())
        TVC.VC = self
        TVC.ctg_label.text = "Apple"
        TVC.category = "everything?q=apple&from=2020-12-26&to=2020-12-31&sortBy=popularity"
        TVC.modalPresentationStyle = .fullScreen
        self.present(TVC, animated: true, completion: nil)
    }
    @objc func tech_tapped(){
        let TVC = HomeViewController(collectionViewLayout: UICollectionViewFlowLayout())
        TVC.VC = self
        TVC.ctg_label.text = "Tech Crunch"
        TVC.category = "top-headlines?sources=techcrunch"
        TVC.modalPresentationStyle = .fullScreen
        self.present(TVC, animated: true, completion: nil)
    }
    @objc func WSJ_tapped(){
        let TVC = HomeViewController(collectionViewLayout: UICollectionViewFlowLayout())
        TVC.VC = self
        TVC.ctg_label.text = "Wall Street Journal"
        TVC.category = "everything?domains=wsj.com"
        TVC.modalPresentationStyle = .fullScreen
        self.present(TVC, animated: true, completion: nil)
    }
    @objc func USB_tapped(){
        let TVC = HomeViewController(collectionViewLayout: UICollectionViewFlowLayout())
        TVC.VC = self
        TVC.ctg_label.text = "🇺🇸 Business"
        TVC.category = "top-headlines?country=us&category=business"
        TVC.modalPresentationStyle = .fullScreen
        self.present(TVC, animated: true, completion: nil)
    }
    @objc func IND_tapped(){
        let TVC = HomeViewController(collectionViewLayout: UICollectionViewFlowLayout())
        TVC.VC = self
        TVC.ctg_label.text = "🇮🇳 Business"
        TVC.category = "top-headlines?country=in&category=business"
        TVC.modalPresentationStyle = .fullScreen
        self.present(TVC, animated: true, completion: nil)
    }
    let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=832c74a7c14b43cfbdb837cf8a0b140c"
    var article: [Article] = []
    func setuplayout(){
        view.addSubview(blinker_btn)
        _ = blinker_btn.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        view.addSubview(ctg_label)
        _ = ctg_label.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: view.frame.height/20, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: view.frame.width, heightConstant: view.frame.height/12)
        view.addSubview(bitcoin_btn)
        _ = bitcoin_btn.anchor(top: ctg_label.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: view.frame.height/26, leftConstant: view.frame.width/6, bottomConstant: 0, rightConstant: view.frame.width/6, widthConstant: view.frame.width/4, heightConstant: view.frame.height/10)
        view.addSubview(USB_button)
        _ = USB_button.anchor(top: bitcoin_btn.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: view.frame.height/24, leftConstant: view.frame.width/6, bottomConstant: 0, rightConstant: view.frame.width/6, widthConstant: view.frame.width/4, heightConstant: view.frame.height/10)
        view.addSubview(Ind_button)
        _ = Ind_button.anchor(top: USB_button.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: view.frame.height/24, leftConstant: view.frame.width/6, bottomConstant: 0, rightConstant: view.frame.width/6, widthConstant: view.frame.width/4, heightConstant: view.frame.height/10)
        view.addSubview(Appl_btn)
        _ = Appl_btn.anchor(top: Ind_button.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: view.frame.height/24, leftConstant: view.frame.width/6, bottomConstant: 0, rightConstant: view.frame.width/6, widthConstant: view.frame.width/4, heightConstant: view.frame.height/10)
        view.addSubview(WSJ_btn)
        _ = WSJ_btn.anchor(top: Appl_btn.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: view.frame.height/24, leftConstant: view.frame.width/6, bottomConstant: 0, rightConstant: view.frame.width/6, widthConstant: view.frame.width/4, heightConstant: view.frame.height/10)
        view.addSubview(Tech_btn)
        _ = Tech_btn.anchor(top: WSJ_btn.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: view.frame.height/24, leftConstant: view.frame.width/6, bottomConstant: 0, rightConstant: view.frame.width/6, widthConstant: view.frame.width/4, heightConstant: view.frame.height/10)
    }
    //var article: [Article] = []
    var i = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    setuplayout()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            if (self.i%2 == 0){
                self.blinker_btn.backgroundColor = .blue
                self.i += 1
            }
            else{
                self.blinker_btn.backgroundColor = .yellow
                self.i += 1
            }
           
            
        }
        view.backgroundColor = UIColor.white

        let url =  URL(string: urlString)
        guard url != nil else{
            return
            
        }
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil{
                // parse Json
                let decoder = JSONDecoder()
                do {
               let newsfeed = try decoder.decode(NewFeed.self, from: data!)
                    print("News Feed")
                 //   print(newsfeed)
                    print(newsfeed.articles.count) 
                    self.article.count == newsfeed.articles.count
                    self.article.append(contentsOf: newsfeed.articles)
                    print("Elements of Article Array")
                    print(self.article.count)
                    print(self.article)
                    print("First Elements")
                    print(self.article[1])
                    print(self.article[1].author)
                }
                catch{
                    print("Error in parsing")
                    self.view.addSubview(self.ParsingError)
                    _ = self.ParsingError.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, topConstant: self.view.frame.height/3, leftConstant: self.view.frame.width/4, bottomConstant: 0, rightConstant: self.view.frame.width/4, widthConstant: self.view.frame.width/4, heightConstant: self.view.frame.height/12)
                    self.ParsingError.text = "Error In Parsing"
                }
                
            }
        }
        datatask.resume()
        
        
        
        // Do any additional setup after loading the view.
    }


}


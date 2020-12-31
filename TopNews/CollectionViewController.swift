//
//  TableViewController.swift
//  TopNews
//
//  Created by Tushar Elangovan on 12/18/20.
//


import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
 
    var NDVC: NewsDetailViewController?
    var VC: ViewController?
    var WVC: WebViewController?

    lazy var blinker_btn:UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        return button
    }()
    let swiped_right = UISwipeGestureRecognizer()
    lazy var ctg_label: UILabel = {
        let label = UILabel()
       // label.backgroundColor = UIColor.white
        label.text = "Categories"
      //  label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor.white
        label.font = UIFont(name: "Avenir", size: 30)
        label.textAlignment = .center
        return label
    }()
    lazy var topview: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    fileprivate let customcellid = "CustomCellID"
    @objc func usr_swiped_back(){
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.duration = 0.75
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window?.layer.add(transition, forKey: kCATransition)
        let VC = ViewController()
        VC.HVC = self
        VC.modalPresentationStyle = .fullScreen
        self.present(VC, animated: true, completion: nil)
    }
    func setuplayout(){
        
        view.addSubview(topview)
        _ = topview.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: 75)
        topview.addSubview(blinker_btn)
        _ = blinker_btn.anchor(top: topview.topAnchor, left: topview.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        topview.addSubview(ctg_label)
        _ = ctg_label.anchor(top: topview.topAnchor, left: topview.leftAnchor, bottom: nil, right: topview.rightAnchor, topConstant: 17.5, leftConstant: 0, bottomConstant: 17.5, rightConstant: 0, widthConstant: topview.frame.width, heightConstant: topview.frame.height/3)
    }
    var apikey = "832c74a7c14b43cfbdb837cf8a0b140c"
    
  //  let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=832c74a7c14b43cfbdb837cf8a0b140c"
    //http://newsapi.org/v2/everything?domains=wsj.com&apiKey=832c74a7c14b43cfbdb837cf8a0b140c
    //http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=832c74a7c14b43cfbdb837cf8a0b140c
    //http://newsapi.org/v2/everything?q=bitcoin&from=2020-11-19&sortBy=publishedAt&apiKey=832c74a7c14b43cfbdb837cf8a0b140c
  
    //https://newsapi.org/v2/()&apiKey=832c74a7c14b43cfbdb837cf8a0b140c
    
    //https://newsapi.org/v2/everything?q=apple&from=2020-12-18&to=2020-12-18&sortBy=popularity&apiKey=832c74a7c14b43cfbdb837cf8a0b140c
    //var category = "everything?q=bitcoin&from=2020-11-19&sortBy=publishedAt"
    var category = ""
   // let urlString = "https://newsapi.org/v2/everything?q=apple&from=2020-12-18&to=2020-12-18&sortBy=popularity&apiKey=832c74a7c14b43cfbdb837cf8a0b140c"
    
    var article: [Article] = []
    
    var i = 0
    var globalerror = ""
    var globalmessage = ""
    func showAlert() {
        let alert = UIAlertController(title: globalerror, message: globalmessage, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            if (self.i%2 == 0){
                self.blinker_btn.backgroundColor = .systemBlue
                self.i += 1
            }
            else{
                self.blinker_btn.backgroundColor = .green
                self.i += 1
            }
        }
        let urlString = "https://newsapi.org/v2/\(category)&apiKey=832c74a7c14b43cfbdb837cf8a0b140c"
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
                    
                    self.article.append(contentsOf: newsfeed.articles)
                    print("Elements of Article Array")
                    print(self.article.count)
                    
                    print(self.article)
                    print("First Elements")
                    print(self.article[1])
                    print(self.article[1].author ?? "No Available")
                }
                catch{
                    self.globalerror = "Error In Parsing Data"
                    self.showAlert()
                    
                    print("Error in parsing")
        
                    
//                    self.globalerror = "Error In Api Parsing"
//                    self.showAlert()
                    
                
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            }
        }
        datatask.resume()
        title = "News"
        print("The height of the phone \(view.frame.height)")
        setupCollectionView()
        setuplayout()
        swiped_right.direction = .right
        collectionView.addGestureRecognizer(swiped_right)
        swiped_right.addTarget(self, action: #selector(usr_swiped_back))
        // Do any additional setup after loading the view.
    }
    fileprivate func setupCollectionView(){
     //   collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: customcellid)
    //    collectionView.register(customcollectionviewcell.self, forCellWithReuseIdentifier: customcellid)
        collectionView.contentInset = UIEdgeInsets(top: 75, left: 0, bottom: 0, right: 0)
    }
    //
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return article.count
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print("TApped me\(indexPath.row)")
        UserDefaults.standard.setValue(indexPath.row, forKey: "indexPath")
        UserDefaults.standard.setValue(article[indexPath.row].url, forKey: "URL")
        let NDVC = NewsDetailViewController()
        NDVC.HVC = self
        NDVC.modalPresentationStyle = .automatic
        self.present(NDVC, animated: true, completion: nil)
       
       
    }
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
//
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customcellid, for: indexPath) as! NewsCell
        cell.newstitle.text = article[indexPath.row].title
        cell.author.text = "By: \(article[indexPath.row].author ?? "Media")"
        cell.publishedat.text = article[indexPath.row].publishedAt
        cell.profileimage.image = UIImage(url: URL(string: "\(article[indexPath.row].urlToImage ?? "apple.com")"))
        
     //   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customcellid, for: indexPath) as! customcollectionviewcell
      //  cell.socialViewController = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height/4)
        //return CGSize(width: view.frame.width, height: view.frame.height)
    }

}
extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}

//class DetailsViewController: UIViewController {
//    lazy var bgview: UIView = {
//        let view = UIView()
//         view.backgroundColor = UIColor.red
//         view.layer.cornerRadius = 10.0
//         return view
//    }()
//    func setuplayout(){
//        var HVC: HomeViewController?
//
//        view.addSubview(bgview)
//        _ = bgview.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: view.frame.width - 10, heightConstant: view.frame.height)
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    setuplayout()
//
//    }
//}



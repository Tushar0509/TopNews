//
//  WebViewController.swift
//  TopNews
//
//  Created by Tushar Elangovan on 12/18/20.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    let swiped_right = UISwipeGestureRecognizer()
    var HVC : HomeViewController?
    var NDVC: NewsDetailViewController?
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    lazy var dismiss_button: UIButton = {
       let button  = UIButton()
        button.setTitle("Dismiss", for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(dissmissVC), for: .touchUpInside)
        return button
    }()
    @objc func dissmissVC(){
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @objc func usr_swiped_back(){
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.duration = 0.75
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window?.layer.add(transition, forKey: kCATransition)
//        let CVC = HomeViewController(collectionViewLayout: UICollectionViewFlowLayout())
//        CVC.WVC = self
//        CVC.modalPresentationStyle = .fullScreen
//        self.present(CVC, animated: true, completion: nil)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    func setuplayout(){
        view.addSubview(webView)
        _ = webView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: view.frame.height)
        view.addSubview(dismiss_button)
        _ = dismiss_button.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant:  view.frame.height/1.75, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: view.frame.width/3 , heightConstant: view.frame.height/10)
//        var i = 0
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
//            print(i)
//            i += 1
//
//            if (i == 5){
//                timer.invalidate()
//            }
//        }
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setuplayout()
     //   let urll = URL(string: "https://www.forbes.com/?sh=5e7bbe2d2254")
        let myURL = URL(string: UserDefaults.standard.value(forKey: "URL") as! String)
       // let myURL = URL(string: HVC?.article[0].urlToImage! ?? "apple.com")
        print("URL: \(myURL)")
           
        if (myURL != nil){
            let myRequest = URLRequest(url: myURL!)
                  webView.load(myRequest)
        }else{
            print("NO URL available")
            webView.backgroundColor = .red
        }
        
       
        swiped_right.direction = .right
        webView.addGestureRecognizer(swiped_right)
        swiped_right.addTarget(self, action: #selector(usr_swiped_back))
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

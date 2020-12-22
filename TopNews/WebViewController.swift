//
//  WebViewController.swift
//  TopNews
//
//  Created by Tushar Elangovan on 12/18/20.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    var HVC : HomeViewController?
    var NDVC: NewsDetailViewController?
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    func setuplayout(){
        view.addSubview(webView)
        _ = webView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: view.frame.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setuplayout()
        let myURL = URL(string: UserDefaults.standard.value(forKey: "URL") as! String)
       // let myURL = URL(string: HVC?.article[0].urlToImage! ?? "apple.com")
        print("URL: \(myURL)")
              let myRequest = URLRequest(url: myURL!)  
              webView.load(myRequest)
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

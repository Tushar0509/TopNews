//
//  NewsCell.swift
//  TopNews
//
//  Created by Tushar Elangovan on 12/18/20.
//

import Foundation
import UIKit

class NewsCell: UICollectionViewCell {
    let swiped_backrecognizer = UISwipeGestureRecognizer()
    
    lazy var bgview: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.systemBlue
        view.layer.cornerRadius = 10.0
        return view
    }()
    lazy var profileimage: UIImageView = {
        let iv = UIImageView()
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 10
        
      //  iv.image = UIImage(named: "logo")
        iv.clipsToBounds = true
        iv.backgroundColor = UIColor.blue
        iv.layer.borderWidth = 0.5
       return iv
    }()
    lazy var newstitlee: UILabel = {
        let label = UILabel()
        //label.text = "News Today"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    lazy var newstitle: UITextView = {
        let tv = UITextView()
        tv.isUserInteractionEnabled = true
        tv.inputView = UIView() //to disable keyboard
        tv.backgroundColor = .systemBlue
        tv.font = UIFont.boldSystemFont(ofSize: 18)
        tv.textColor = .white
        return tv
    }()
    lazy var betweenview: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor.systemOrange
        return view
    }()
    lazy var title: UILabel = {
        let label = UILabel()
        label.text = "News Today"
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    lazy var author: UITextView = {
        let label = UITextView()
        label.isUserInteractionEnabled = true
        label.inputView = UIView() //to disable keyboard
        label.backgroundColor = .systemBlue
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
       // label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var publishedat: UILabel = {
        let label = UILabel()
        return label
    }()
   
    
    func setuplayout(){
        contentView.addSubview(bgview)
        _ = bgview.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: contentView.frame.width - 10, heightConstant: contentView.frame.height)
        bgview.addSubview(profileimage)
        _ = profileimage.anchor(top: bgview.topAnchor, left: bgview.leftAnchor, bottom: contentView.bottomAnchor, right: nil, topConstant: 5, leftConstant: 5, bottomConstant: 5, rightConstant: 0, widthConstant: contentView.frame.width/4, heightConstant: contentView.frame.height)
        bgview.addSubview(newstitle)
        _ = newstitle.anchor(top: bgview.topAnchor, left: profileimage.rightAnchor, bottom: nil, right: bgview.rightAnchor, topConstant: 2, leftConstant: 5, bottomConstant: 0, rightConstant: 5, widthConstant: contentView.frame.width/2, heightConstant:  contentView.frame.height/1.8)

        bgview.addSubview(publishedat)
        _ = publishedat.anchor(top: nil, left: profileimage.rightAnchor, bottom: contentView.bottomAnchor, right: bgview.rightAnchor, topConstant: 5, leftConstant: 5, bottomConstant: 0, rightConstant: 5, widthConstant: contentView.frame.width, heightConstant: bgview.frame.height/8)
        
        bgview.addSubview(betweenview)
        _ = betweenview.anchor(top: newstitle.bottomAnchor, left: profileimage.rightAnchor, bottom: publishedat.topAnchor, right: bgview.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: bgview.frame.width, heightConstant: 10)
        
        //   _ = publishedat.anchor(top: author.bottomAnchor, left: bgview.leftAnchor, bottom: nil, right: bgview.rightAnchor, topConstant: 5, leftConstant: 5, bottomConstant: 0, rightConstant: 5, widthConstant: contentView.frame.width, heightConstant: bgview.frame.height/6)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setuplayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


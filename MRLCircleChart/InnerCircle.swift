//
//  InnerCircle.swift
//  MRLCircleChart
//
//  Created by parth on 7/14/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class Friend: NSObject {
  
  var name: String?
  var profileImageName: String?
  
}

class Message {
  
  var text : String?
  var date : NSDate?
  
  var friend: Friend?
  
}

class FriendsController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
  
  private let cellId = "cellId"
  
  

  
  var messages : [Message]?
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
        
    FloatingActionButton.ref = navigationController
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
        
    let floatingActionButon = FloatingActionButton()
    floatingActionButon.createFloatingButtons(self)
    
    
    collectionView?.backgroundColor = UIColor.whiteColor()
    
    collectionView?.alwaysBounceVertical = true
    
    collectionView?.registerClass(MessageCell.self, forCellWithReuseIdentifier: cellId)
    
    setupData()
    
  }
  
  internal func returnNavRef() -> UINavigationController {
    
    return navigationController!
    
  }
  
  
  func setupData(){
    
    let parth = Friend()
    parth.name = "parth anand"
    parth.profileImageName = "parth"
    
    let message = Message()
    message.friend = parth
    message.text = "hello my name is parth, i am am your friend"
    message.date = NSDate()
    
    
    
    let enrique = Friend()
    enrique.name = "enrique iglesias"
    enrique.profileImageName = "enrique"
    
    let messageEnrique = Message()
    messageEnrique.friend = enrique
    messageEnrique.text = "i know i am a good singer ,but i don't boast"
    messageEnrique.date = NSDate()
    
    
    messages = [message , messageEnrique]
    
  }

  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 1
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    if let count = messages?.count {
      
      return count
    }
    
    return 0
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! MessageCell
    
    if let message = messages?[indexPath.item] {
      
      cell.message = message
    }
    
    return cell
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSizeMake(view.frame.width , 70)
  }
  
}


class MessageCell : BaseCell {
  
  var message : Message? {
    
    didSet{
      
      nameLabel.text = message?.friend?.name
      
      if let profileImageName = message?.friend?.profileImageName{
        
        profileImageView.image = UIImage(named : profileImageName)
      }
      
      
    }
    
  }
  
  let profileImageView : UIImageView = {
    
    let imageView = UIImageView()
    imageView.contentMode = .ScaleAspectFill
    imageView.image = UIImage(named : "parth")
    imageView.layer.cornerRadius = 25
    imageView.layer.masksToBounds = true
    return imageView
    
  }()
  
  
  let dividerLineView : UIView = {
    
    let view = UIView()
    view.backgroundColor = UIColor(white : 0.5 , alpha : 0.2)
    return view
    
  }()
  
  let nameLabel : UILabel = {
    
    let label = UILabel()
    label.text = "parth anand"
    label.font = UIFont.systemFontOfSize(18)
    return label
    
  }()
  
  
  
  
  override func setupViews(){
    
    
    addSubview(profileImageView)
    addSubview(dividerLineView)
    
    setupContainerView()
    
    
    
    addConstraintsWithFormat("H:|-14-[v0(50)]", views: profileImageView)
    
    addConstraintsWithFormat("V:[v0(50)]", views: profileImageView)
    
    addConstraint(NSLayoutConstraint(item: profileImageView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
    
    addConstraintsWithFormat("H:|-82-[v0]|", views: dividerLineView)
    
    addConstraintsWithFormat("V:[v0(1)]|", views: dividerLineView)
    
    
  }
  
  private func setupContainerView(){
    
    
    let containerView = UIView()
    addSubview(containerView)
    
    addConstraintsWithFormat("H:|-90-[v0]|", views: containerView)
    addConstraintsWithFormat("V:[v0(50)]", views: containerView)
    
    addConstraint(NSLayoutConstraint(item: containerView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
    
    containerView.addSubview(nameLabel)
    
    
    containerView.addConstraintsWithFormat("H:|[v0]|", views: nameLabel)
    containerView.addConstraintsWithFormat("V:|[v0]|", views: nameLabel)
    
   
    
    
    
    
    
  }
  
}


extension UIView {
  
  func addConstraintsWithFormat(format : String , views : UIView...){
    
    var viewsDictionary = [String : UIView]()
    
    for (index , view) in views.enumerate() {
      let key = "v\(index)"
      viewsDictionary[key] = view
      view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    
    
  }
  
}


class BaseCell : UICollectionViewCell {
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews(){
    backgroundColor = UIColor.blueColor()
  }
  
  
  
}

//hi how are you





//
//  FTChatMessageTableViewController.swift
//  ChatMessageDemoProject
//
//  Created by liufengting on 16/2/28.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

import UIKit

class FTChatMessageTableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, FTChatMessageInputViewDelegate, FTChatMessageHeaderDelegate {
    
    var messageArray : [FTChatMessageModel] = []
    var delegete : FTChatMessageDelegate?
    var dataSource : FTChatMessageDataSource?
    var shouldShowSendTime : Bool = true
    var shouldShowSenderName : Bool = true
    var messageInputMode : FTChatMessageInputMode = FTChatMessageInputMode.none

    lazy var messageTableView : UITableView! = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: FTScreenWidth, height: FTScreenHeight), style: .plain)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
        tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, FTDefaultInputViewHeight, 0)
        tableView.delegate = self
        tableView.dataSource = self
        
        let header = UIView(frame: CGRect( x: 0, y: 0, width: FTScreenWidth, height: FTDefaultMargin*2))
        tableView.tableHeaderView = header
        
        let footer = UIView(frame: CGRect( x: 0, y: 0, width: FTScreenWidth, height: FTDefaultInputViewHeight))
        tableView.tableFooterView = footer
        
        return tableView
    }()
    
    lazy var messageInputView : FTChatMessageInputView! = {
        let inputView : FTChatMessageInputView! = Bundle.main.loadNibNamed("FTChatMessageInputView", owner: nil, options: nil)?[0] as! FTChatMessageInputView
        inputView.frame = CGRect(x: 0, y: FTScreenHeight-FTDefaultInputViewHeight, width: FTScreenWidth, height: FTDefaultInputViewHeight)
        inputView.inputDelegate = self
        return inputView
    }()
    
    lazy var messageRecordView : FTChatMessageRecorderView! = {
        let recordView : FTChatMessageRecorderView! = Bundle.main.loadNibNamed("FTChatMessageRecorderView", owner: nil, options: nil)?[0] as! FTChatMessageRecorderView
        recordView.frame = CGRect(x: 0, y: FTScreenHeight, width: FTScreenWidth, height: FTDefaultAccessoryViewHeight)
        return recordView
    }()
    
    lazy var messageAccessoryView : FTChatMessageAccessoryView! = {
        let accessoryView = Bundle.main.loadNibNamed("FTChatMessageAccessoryView", owner: nil, options: nil)?[0] as! FTChatMessageAccessoryView
        accessoryView.frame = CGRect(x: 0, y: FTScreenHeight, width: FTScreenWidth, height: FTDefaultAccessoryViewHeight)
        return accessoryView
    }()


    let sender1 = FTChatMessageUserModel.init(id: "1", name: "Someone", icon_url: "http://ww3.sinaimg.cn/mw600/6cca1403jw1f3lrknzxczj20gj0g0t96.jpg", extra_data: nil, isSelf: false)
    let sender2 = FTChatMessageUserModel.init(id: "2", name: "LiuFengting", icon_url: "http://ww3.sinaimg.cn/mw600/9d319f9agw1f3k8e4pixfj20u00u0ac6.jpg", extra_data: nil, isSelf: true)
    let sender3 = FTChatMessageUserModel.init(id: "3", name: "Someone else", icon_url: "http://ww3.sinaimg.cn/mw600/9d319f9agw1f3k8e4pixfj20u00u0ac6.jpg", extra_data: nil, isSelf: false)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(messageTableView)

        self.view.addSubview(messageInputView)

        self.view.addSubview(messageRecordView)
        
        self.view.addSubview(messageAccessoryView)
        
        DispatchQueue.main.asyncAfter( deadline: DispatchTime.now() + Double(Int64(0.1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            self.scrollToBottom(false)
        }
        
    }

    

    
    



    
    
    internal func addNewMessage(_ message : FTChatMessageModel) {
        
        messageArray.append(message);
        
        messageTableView.insertSections(IndexSet.init(integersIn: NSMakeRange(messageArray.count-1, 1).toRange() ?? 0..<0), with: UITableViewRowAnimation.bottom)
        
        self.scrollToBottom(true)

    }
    
   

    


}

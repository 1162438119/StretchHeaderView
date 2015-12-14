//
//  ViewController.swift
//  Swift12.11.2
//
//  Created by mac on 15/12/11.
//  Copyright (c) 2015年 dqy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    //懒加载
    lazy var tableview: UITableView = {
        
        let temptableview = UITableView(frame: CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20))
        
        temptableview.backgroundColor = UIColor.whiteColor()
        
        temptableview.delegate = self
        
        temptableview.dataSource = self
        
        temptableview.tableFooterView = UIView()
        
        temptableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return temptableview

    }()
    
    lazy var headerView: UIImageView = {
       
        //头部
        let tempheaderview = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, 100))
        
        tempheaderview.image = UIImage(named: "1.png")
        
        return tempheaderview
    }()
    
    var mayheader: DQYHeaderView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        self.view.addSubview(tableview)
        
        tableview.tableHeaderView = headerView
        
        
        mayheader = DQYHeaderView()
        
        mayheader?.stretchHeaderForTableView(tableview, sendsubview: headerView)
        
        

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // tableview datasource
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableview.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = "哈哈"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    //要实现的代理方法
    func scrollViewDidScroll(scrollView: UIScrollView) {
        mayheader?.scrollViewDidScroll(scrollView)
    }
    

    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


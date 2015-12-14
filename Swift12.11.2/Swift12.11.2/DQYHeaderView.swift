//
//  DQYHeaderView.swift
//  Swift12.11.2
//
//  Created by mac on 15/12/11.
//  Copyright (c) 2015年 dqy. All rights reserved.
//

import UIKit

class DQYHeaderView: NSObject {
   
    var tableview: UITableView?
    
    var view: UIView?
    
    var initFrame: CGRect?
    
    var defaultHeight: CGFloat?
    
    
    //拉伸
    func stretchHeaderForTableView(sendtableview:UITableView,sendsubview:UIView){
        
        
        tableview = sendtableview
        
        view = sendsubview
        
        initFrame = view?.frame
        
        defaultHeight = initFrame?.size.height
        
        var tempView = UIView(frame: initFrame!)
        
        tableview?.tableHeaderView = tempView
        
        tableview?.addSubview(view!)
        
    }
    
    
    //滚动时发生改变
    func scrollViewDidScroll(sendscrollview:UIScrollView) {
        
        if sendscrollview.contentOffset.y < 0 {
            
            let offsetY = (sendscrollview.contentOffset.y + sendscrollview.contentInset.top) * -1
            
            initFrame?.origin.y = -offsetY * 1
            initFrame?.origin.x = -offsetY / 2
            
            initFrame?.size.width = (tableview?.frame.size.width)! + offsetY
            initFrame?.size.height = defaultHeight! + offsetY
            
            view?.frame = initFrame!
            
        }
        
    }

    
    
}

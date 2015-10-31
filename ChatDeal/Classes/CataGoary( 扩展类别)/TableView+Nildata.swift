//
//  TableView+Mydata.swift
//  ChangTongServers
//
//  Created by dongjun on 15/10/31.
//  Copyright © 2015年 dongjun. All rights reserved.
//

import UIKit

extension UITableView{

    //tableview没有数据的时候调用
    //(1).在UITableView的数据源方法中进行调用就可以了。如果你的TableView有多个Section,那么可以在- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView方法中进行调用。
    //(2).如果你的TableView只有一个分组，那么可以在- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 中进行调用
    func tableViewDisplayWitMsg(message:NSString,rowCount:NSInteger){
        if (rowCount == 0) {
            // Display a message when the table is empty
            // 没有数据的时候，UILabel的显示样式
            let messageLabel = UILabel()
            
            messageLabel.text = message as String
            messageLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
            messageLabel.textColor = UIColor.lightGrayColor()
            messageLabel.textAlignment = NSTextAlignment.Center;
            messageLabel.sizeToFit()
            
            self.backgroundView = messageLabel;
            self.separatorStyle = UITableViewCellSeparatorStyle.None
        } else {
            self.backgroundView = nil;
            self.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        }
    }

}

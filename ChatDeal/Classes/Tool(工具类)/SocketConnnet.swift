//
//  SocketConnnet.swift
//  SchoolRound
//
//  Created by dongjun on 15/10/9.
//  Copyright © 2015年 dongjun. All rights reserved.
//

import UIKit


//连接socket且发送和接收数据
func getSocketData(url:String)->NSDictionary{
    var dic = NSDictionary()
    //创建socket60.173.245.180 8789
    let client:TCPClient = TCPClient(addr: "192.168.10.106", port: 2121)
    //连接
    var (success,errmsg)=client.connect(timeout: 1)
    if success{
        //发送数据
        var (success,errmsg)=client.send(str:url)
        if success{
            //读取数据
            let data=client.read(1024*10)
            if let d=data{
                let datas = NSData(bytes: d, length: d.count)
                let dogString:String = String(data: datas, encoding: NSUTF8StringEncoding)!
                print("接收数据：\(dogString)")
                let json: AnyObject? = try? NSJSONSerialization.JSONObjectWithData(datas, options: [])
                dic = json as! NSDictionary
            }
        }else{
            print(errmsg)
        }
    }else{
        print(errmsg)
    }
    return dic
}

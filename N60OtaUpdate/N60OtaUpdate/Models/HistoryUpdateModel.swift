//
//  HistoryUpdateModel.swift
//  N60OtaUpdate
//
//  Created by xialiang on 2019/10/30.
//  Copyright © 2019 xialiang. All rights reserved.
//

import UIKit
import HandyJSON

public class HistoryUpdateModel: HandyJSON {
        public var total:Int!
        public var code:Int!
        public var msg:String!
        public var result:Array<HResultMode>!
        
        public  required  init() {
            
        }
    }

    public class HResultMode: HandyJSON {
        public  var index:Int!
        public var taskCarId:String!
        public  var status:Int!
        public var description:String!
        public var upgradeDate:String!
        
        public required init() {
            
        }
    }

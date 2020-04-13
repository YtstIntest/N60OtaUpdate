//
//  ConfirmUpdateBean.swift
//  N60OtaUpdate
//
//  Created by xialiang on 2019/10/30.
//  Copyright © 2019 xialiang. All rights reserved.
//

import UIKit
import HandyJSON

public class ConfirmUpdateModel: HandyJSON {
        public  var result:NSObject!
        public  var total:Int!
        public var code:Int!
        public var msg:String!
        public  required init() {
            
        }
        
    }


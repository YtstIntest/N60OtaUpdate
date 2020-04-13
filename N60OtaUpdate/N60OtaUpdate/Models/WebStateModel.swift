//
//  WebStateModel.swift
//  N60OtaUpdate
//
//  Created by xialiang on 2019/10/30.
//  Copyright © 2019 xialiang. All rights reserved.
//

import UIKit
import HandyJSON

public class WebStateModel: HandyJSON {
    public var result:ResultMode!
    public var code:Int!
    public var msg:String!
    
    public required init() {
        
    }
    
}
public class ResultMode: HandyJSON {
    public var status:Int!
    public var resultCode:Int!
    public  required init() {
        
    }
    
}

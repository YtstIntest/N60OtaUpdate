//
//  UpdateResultModel.swift
//  N60OtaUpdate
//
//  Created by xialiang on 2019/10/30.
//  Copyright © 2019 xialiang. All rights reserved.
//

import HandyJSON
import UIKit

public class UpdateResultModel: HandyJSON {
    public var result: UResultMode!
    public var code: Int!
    public var msg: String!
    public required init() {
    }
}

public class UResultMode: HandyJSON {
    public var result: Int!
    public var resultCode: Int!

    public required init() {
    }
}

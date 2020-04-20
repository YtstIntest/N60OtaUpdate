//
//  UpdateProgressModel.swift
//  N60OtaUpdate
//
//  Created by xialiang on 2019/10/30.
//  Copyright © 2019 xialiang. All rights reserved.
//

import HandyJSON
import UIKit

public class UpdateProgressModel: HandyJSON {
    public var result: UResultModel!
    public var code: Int!
    public var msg: String!
    public required init() {
    }
}

public class UResultModel: HandyJSON {
    public var vin: String!
    public var result: Int!
    public var status: Int!
    public var resultCode: Int!
    public var progress: Int!

    public required init() {
    }
}

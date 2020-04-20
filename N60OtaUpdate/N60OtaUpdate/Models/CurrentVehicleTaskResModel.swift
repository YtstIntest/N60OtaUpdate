//
//  CurrentVehicleTaskResBean.swift
//  N60OtaUpdate
//
//  Created by xialiang on 2019/10/30.
//  Copyright © 2019 xialiang. All rights reserved.
//

import HandyJSON
import UIKit

public class CurrentVehicleTaskResModel: HandyJSON {
    public var result: CResultMode!
    public var total: Int!
    public var code: Int!
    public var msg: String!
    public required init() {
    }
}

public class CResultMode: HandyJSON {
    public var taskCarId: String!
    public var taskType: Int!
    public var nVer: String!
    public var size: Double!
    public var description: String!
    public var duration: Int!
    public var isNewTask: Int!
    public var time: String!

    public required init() {
    }
}

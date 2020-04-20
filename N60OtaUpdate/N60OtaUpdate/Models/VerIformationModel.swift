//
//  VerIformationBean.swift
//  N60OtaUpdate
//
//  Created by xialiang on 2019/10/30.
//  Copyright © 2019 xialiang. All rights reserved.
//

import HandyJSON
import UIKit

public class VerIformationModel: HandyJSON {
    public var result: VResultMode!
    public var code: Int!
    public var msg: String!
    public required init() {
    }
}

public class VResultMode: HandyJSON {
    public var cVer: String!

    public required init() {
    }
}

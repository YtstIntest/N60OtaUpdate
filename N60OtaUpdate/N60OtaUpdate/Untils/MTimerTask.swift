//
//  MTimerTask.swift
//  N60OtaUpdate
//
//  Created by xialiang on 2019/10/30.
//  Copyright © 2019 xialiang. All rights reserved.
//

import UIKit
import HandyJSON

class MTimerTask: NSObject {
    typealias Successe = ((UpdateProgressModel)->(Void))
    typealias Failed = ((String)->(Void))
    var timer:Timer!
    var vin:String!
    var taskCarId:String!
    var uDate:String!
    
    var successed:Successe!
    var failed:Failed!
    
    

    
    init(vin:String,taskCarId:String,uDate:String,success: @escaping Successe,failed: @escaping Failed) {
        self.vin=vin
        self.taskCarId=taskCarId
        self.uDate=uDate
        self.successed=success
        self.failed=failed
    }
    func StarTimer() -> Void {
        if #available(iOS 10.0, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: {(asdq)->(Void)in
                NetWorkRequest(.queryCarUpdateTask(vin: self.vin, uDate: self.uDate, taskcarId: self.taskCarId), completion: {(jsonString)->(Void)in
                    if let mappedObject = JSONDeserializer<BaseResponse<UpdateProgressModel>>.deserializeFrom(json: jsonString) {
                        switch mappedObject.statusCode {
                        case SUCCESS:
                            if(mappedObject.body.result != nil){
                                if(mappedObject.body.result.progress == 100 || mappedObject.body.result.resultCode != -1 || mappedObject.body.result.status != 10){
                                    self.StopTimer()
                                }
                                if(self.vin != nil){
                                    mappedObject.body.result.vin = self.vin
                                }
                            }

                            // 从字符串转换为对象实例
                            self.successed(mappedObject.body)
                            break
                        case ERRO_NOT_FOUNT:
                            self.failed(ERRO_NOT_FOUNT_MESSAGE)
                            self.StopTimer()
                            break
                        case ERRO_SERVER:
                            self.failed(ERRO_SERVER_MESSAGE)
                            self.StopTimer()
                            break
                        case ERRO_UPTATE:
                            self.failed(ERRO_UPTATE_MESSAGE)
                            self.StopTimer()

                            break
                        default:
                            self.failed(ERRO_NOT_MESSAGE)
                            self.StopTimer()
                            break

                        }

                    }
                }, failed: {(failedCallback)->(Void)in
                    self.failed(failedCallback)

                })
                
            })}else{
            print("版本过低")
        }
    }
    
    func StopTimer() -> Void {
        timer.invalidate()
    }
    
    
}

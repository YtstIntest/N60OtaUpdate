//
//  SimulationModle.swift
//  N60OtaUpdate
//
//  Created by xialiang on 2019/11/1.
//  Copyright © 2019 xialiang. All rights reserved.
//

import UIKit

class SimulationModle: NSObject {
    
    func getWebStateModel(status:Int) -> WebStateModel {
        let model = WebStateModel()
        model.code=1
        model.msg="获取到状态"
        let resultModel = ResultMode()
        resultModel.status=status
        model.result=resultModel
        return model
    }
    
    
    func getCurrentVehicleTaskResModel() -> CurrentVehicleTaskResModel {
        let model = CurrentVehicleTaskResModel()
        model.code=1
        model.msg="获取到最新升级信息"
        model.total=1
        let resultModel = CResultMode();
        resultModel.taskCarId="05d2bf95-a152-4dde-8f9e-a514b39bc88a"
        resultModel.taskType=0
        resultModel.nVer="1.012.5"
        resultModel.size=100
        resultModel.description="更新说明"
        resultModel.duration=50
        resultModel.isNewTask=1
        resultModel.time="2019年9月4号 09:36"
        model.result = resultModel
        return model
    }
    
    
    func getVerIformationModel() -> VerIformationModel {
        let model = VerIformationModel()
        model.code=1
        model.msg="获取到当前版本"
        let resultModel = VResultMode()
        resultModel.cVer="1.012.4"
        model.result=resultModel
        return model
    }
    
    func getUpdateProgressModel(vin:String,progress:Int) -> UpdateProgressModel {
        let model = UpdateProgressModel()
        model.code=1
        model.msg="查询到升级进度值"
        let resultModel = UResultModel()
        resultModel.vin=vin
        resultModel.progress=progress
        model.result=resultModel
        return model
    }
    
    
    func getUpdateResultModel() -> UpdateResultModel {
        let model = UpdateResultModel()
        model.code=1
        model.msg="获取到升级结果"
        let resultModel = UResultMode()
        resultModel.result=1
        model.result=resultModel
        return model
    }
    
    
    func getHistoryUpdateModel() -> HistoryUpdateModel {
        let model = HistoryUpdateModel()
        model.code=1
        model.msg="查询历史升级记录"
        model.total=5
        var listModel = [HResultMode]()
        
        let result1 = HResultMode()
        result1.description="任务说明"
        result1.index=1
        result1.status=1
        result1.upgradeDate="2019年9月18号 09:36"
        result1.taskCarId="3a523d8a-5ce1-4a9b-bec9-75b64c7c8dde"
        listModel.append(result1)
        
        let result2 = HResultMode()
        result2.description="任务说明"
        result2.index=2
        result2.status=0
        result2.upgradeDate="2019年9月13号 09:36"
        result2.taskCarId="3a523d8a-5ce5-4a9b-bec9-75b64c7c8dde"
        listModel.append(result2)
        
        let result3 = HResultMode()
        result3.description="任务说明"
        result3.index=3
        result3.status=1
        result3.upgradeDate="2019年9月12号 09:36"
        result3.taskCarId="3a523d8a-5ce4-4a9b-bec9-75b64c7c8dde"
        listModel.append(result3)
        
        let result4 = HResultMode()
        result4.description="任务说明"
        result4.index=4
        result4.status=1
        result4.upgradeDate="2019年9月17号 09:36"
        result4.taskCarId="3a523d8a-5ce3-4a9b-bec9-75b64c7c8dde"
        listModel.append(result4)
        
        let result5 = HResultMode()
        result5.description="任务说明"
        result5.index=1
        result5.status=1
        result5.upgradeDate="2019年9月16号 09:36"
        result5.taskCarId="3a523d8a-5ce2-4a9b-bec9-75b64c7c8dde"
        listModel.append(result5)
        model.result = listModel
        return model
        
    }
    
    func getConfirmUpdateModel() -> ConfirmUpdateModel {
        let model = ConfirmUpdateModel()
        model.code=1
        model.msg=""
        return model
    }
    
    
    
}

//
//  RemoteUpdateManage.swift
//  N60OtaUpdate
//
//  Created by xialiang on 2019/10/30.
//  Copyright © 2019 xialiang. All rights reserved.
//

import Foundation

import HandyJSON

open class RemoteUpdateManage: NSObject {
    var list = [MTimerTask]()

    /// 查询平台状态
    /// - Parameter vin: 车辆VIN
    /// - Parameter uDate: 操作时间
    /// - Parameter taskcarId: 车辆任务id
    public func queryState( vin: String, uDate: String, taskcarId: String, success: @escaping (WebStateModel) -> Void, failed: @escaping (String) -> Void) {
        NetWorkRequest(.queryCarUpdateTask(vin: vin, uDate: uDate, taskcarId: taskcarId), completion: { (jsonString) -> Void in
            if let mappedObject = JSONDeserializer<BaseResponse<WebStateModel>>.deserializeFrom(json: jsonString) {
                switch mappedObject.statusCode {
                case SUCCESS:
                    // 从字符串转换为对象实例
                    success(mappedObject.body)
                    break
                case ERRO_NOT_FOUNT:
                    failed(ERRO_NOT_FOUNT_MESSAGE)
                    break
                case ERRO_SERVER:
                    failed(ERRO_SERVER_MESSAGE)

                    break
                case ERRO_UPTATE:
                    failed(ERRO_UPTATE_MESSAGE)

                    break
                default:
                    failed(ERRO_NOT_MESSAGE)
                    break
                }
            }
        }, failed: { (failedCallback) -> Void in
            failed(failedCallback)

        })
    }

    /// 获取车辆升级信息
    /// - Parameter vin: 车辆VIN
    /// - Parameter uDate: 操作时间
    /// - Parameter taskcarId: 车辆任务id
    public func getCarUpdateTask(vin: String, uDate: String, taskcarId: String, success: @escaping (CurrentVehicleTaskResModel) -> Void, failed: @escaping (String) -> Void) {
        NetWorkRequest(.queryCarUpdateTask(vin: vin, uDate: uDate, taskcarId: taskcarId), completion: { (jsonString) -> Void in
            if let mappedObject = JSONDeserializer<BaseResponse<CurrentVehicleTaskResModel>>.deserializeFrom(json: jsonString) {
                switch mappedObject.statusCode {
                case SUCCESS:
                    // 从字符串转换为对象实例
                    success(mappedObject.body)
                    break
                case ERRO_NOT_FOUNT:
                    failed(ERRO_NOT_FOUNT_MESSAGE)
                    break
                case ERRO_SERVER:
                    failed(ERRO_SERVER_MESSAGE)

                    break
                case ERRO_UPTATE:
                    failed(ERRO_UPTATE_MESSAGE)

                    break
                default:
                    failed(ERRO_NOT_MESSAGE)
                    break
                }
            }
        }, failed: { (failedCallback) -> Void in
            failed(failedCallback)

        })
    }

    /// 获取当前版本信息
    /// - Parameter vin: 车辆VIN
    /// - Parameter uDate: 操作时间
    public func getVersionInformation(vin: String, uDate: String, success: @escaping (VerIformationModel) -> Void, failed: @escaping (String) -> Void) {
        NetWorkRequest(.queryCarUpdateTask(vin: vin, uDate: uDate, taskcarId: ""), completion: { (jsonString) -> Void in
            if let mappedObject = JSONDeserializer<BaseResponse<VerIformationModel>>.deserializeFrom(json: jsonString) {
                switch mappedObject.statusCode {
                case SUCCESS:
                    // 从字符串转换为对象实例
                    success(mappedObject.body)
                    break
                case ERRO_NOT_FOUNT:
                    failed(ERRO_NOT_FOUNT_MESSAGE)
                    break
                case ERRO_SERVER:
                    failed(ERRO_SERVER_MESSAGE)

                    break
                case ERRO_UPTATE:
                    failed(ERRO_UPTATE_MESSAGE)

                    break
                default:
                    failed(ERRO_NOT_MESSAGE)
                    break
                }
            }
        }, failed: { (failedCallback) -> Void in
            failed(failedCallback)

        })
    }

    /// 查询升级进度
    /// - Parameter vin: 车辆VIN
    /// - Parameter taskCarId: 车辆任务id
    /// - Parameter uDate: 操作时间

    public func queryUpdateProgress(vin: String, taskCarId: String, uDate: String, success: @escaping (UpdateProgressModel) -> Void, failed: @escaping (String) -> Void) {
        let timer = MTimerTask(vin: vin, taskCarId: taskCarId, uDate: uDate, success: success, failed: failed)
        timer.StarTimer()
        list.append(timer)
    }

    /// 查询升级结果
    /// - Parameter vin: 车辆VIN
    /// - Parameter taskcarId: 车辆任务id
    /// - Parameter uDate: 操作时间
    public func queryUpdateResult(vin: String, taskcarId: String, uDate: String, success: @escaping (UpdateResultModel) -> Void, failed: @escaping (String) -> Void) {
        NetWorkRequest(.queryCarUpdateTask(vin: vin, uDate: uDate, taskcarId: taskcarId), completion: { (jsonString) -> Void in
            if let mappedObject = JSONDeserializer<BaseResponse<UpdateResultModel>>.deserializeFrom(json: jsonString) {
                switch mappedObject.statusCode {
                case SUCCESS:
                    // 从字符串转换为对象实例
                    success(mappedObject.body)
                    break
                case ERRO_NOT_FOUNT:
                    failed(ERRO_NOT_FOUNT_MESSAGE)
                    break
                case ERRO_SERVER:
                    failed(ERRO_SERVER_MESSAGE)

                    break
                case ERRO_UPTATE:
                    failed(ERRO_UPTATE_MESSAGE)

                    break
                default:
                    failed(ERRO_NOT_MESSAGE)
                    break
                }
            }
        }, failed: { (failedCallback) -> Void in
            failed(failedCallback)

        })
    }

    /// 获取历史升级信息
    /// - Parameter vin: 车辆VIN
    /// - Parameter uDate: 日期时间
    /// - Parameter pi: 页面索引
    /// - Parameter ps: 页面大小
    public func getHistoryUpdate(vin: String, uDate: String, pi: Int, ps: Int, success: @escaping (HistoryUpdateModel) -> Void, failed: @escaping (String) -> Void) {
        NetWorkRequest(.getUpdateTaskList(vin: vin, pi: pi, ps: ps, uDate: uDate), completion: { (jsonString) -> Void in
            if let mappedObject = JSONDeserializer<BaseResponse<HistoryUpdateModel>>.deserializeFrom(json: jsonString) {
                switch mappedObject.statusCode {
                case SUCCESS:
                    // 从字符串转换为对象实例
                    success(mappedObject.body)
                    break
                case ERRO_NOT_FOUNT:
                    failed(ERRO_NOT_FOUNT_MESSAGE)
                    break
                case ERRO_SERVER:
                    failed(ERRO_SERVER_MESSAGE)

                    break
                case ERRO_UPTATE:
                    failed(ERRO_UPTATE_MESSAGE)

                    break
                default:
                    failed(ERRO_NOT_MESSAGE)
                    break
                }
            }
        }, failed: { (failedCallback) -> Void in
            failed(failedCallback)

        })
    }

    /// 确认升级任务
    /// - Parameter taskcarId: 车辆任务id
    /// - Parameter uDate: 操作时间
    /// - Parameter type: 确认类型
    /// - Parameter result: 确认结果
    public func confirmUpgrade(taskcarId: String, uDate: String, type: Int, result: Int, success: @escaping (ConfirmUpdateModel) -> Void, failed: @escaping (String) -> Void) {
        NetWorkRequest(.confirmUpgrade(taskcarId: taskcarId, uDate: uDate, type: type, result: result), completion: { (jsonString) -> Void in
            if let mappedObject = JSONDeserializer<BaseResponse<ConfirmUpdateModel>>.deserializeFrom(json: jsonString) {
                switch mappedObject.statusCode {
                case SUCCESS:
                    // 从字符串转换为对象实例
                    success(mappedObject.body)
                    break
                case ERRO_NOT_FOUNT:
                    failed(ERRO_NOT_FOUNT_MESSAGE)
                    break
                case ERRO_SERVER:
                    failed(ERRO_SERVER_MESSAGE)

                    break
                case ERRO_UPTATE:
                    failed(ERRO_UPTATE_MESSAGE)

                    break
                default:
                    failed(ERRO_NOT_MESSAGE)
                    break
                }
            }
        }, failed: { (failedCallback) -> Void in
            failed(failedCallback)

        })
    }

    /// 清楚所有定时任务
    public func clear() {
        for itme in list {
            itme.StopTimer()
        }
    }
}

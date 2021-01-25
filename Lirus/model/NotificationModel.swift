//
//  NotificationModel.swift
//  Lirus
//
//  Created by Айдар Чакиев on 22/1/21.
//

import Foundation
import ObjectMapper
import UIKit

class BaseResponse<T: Mappable>: Mappable {
   
    var status : String?
    var data: T?
    var dataArray: [T]?
    var message: String?
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map) {
        if let _ = try? map.value("data") as [Any] {
            dataArray <- map["data"]
        } else {
            data <- map["data"]
        }
        status <- map["status"]
        message <- map["message"]
    }
}

class BaseModel: Mappable {
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
    {
    }
}

class NotificationData: BaseModel {
    var name: String?
    var text: String?
    var not_type: String?
    var created_date: String?
        
    override func mapping(map: Map) {
        
        name <- map["name"]
        text <- map["text"]
        created_date <- map["created_date"]
        not_type <- map["not_type"]
    }
}


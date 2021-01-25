//
//  NotificationService.swift
//  Lirus
//
//  Created by Айдар Чакиев on 24/1/21.
//

import Foundation
import Alamofire
import ObjectMapper

protocol ServiceView: BaseView {
    
}



class NotificationService{
    
    let delegate: ServiceView!
    
    init(delegate: ServiceView) {
        self.delegate = delegate
    }
    
    
    func getNotification(handler: @escaping([NotificationData]) -> Void){
        
        delegate.showLoading()
        let url = "\(BASE_URL)notification"
        print(url)
        let headers: HTTPHeaders = ["Content-Type":"application/json"]

        AF.request(url, method: .get, headers: headers).responseJSON{
            (response) in
            print("\n getNotification ------------- \(String(describing: response.value))")
            self.delegate.hideLoading()
            switch (response.result){
            
            case .success(_):
                guard let mapperResponse = Mapper<BaseResponse<NotificationData>>().map(JSONObject: response.value) else{
                    print(response.result)
                    return
                }
                
                if mapperResponse.status != "success" {
                    self.delegate.error(error: mapperResponse.message!)
                    return
                }
                
                handler(mapperResponse.dataArray!)
            case .failure(_):
                self.delegate.error(error:"Сервер не отвечает или проблемы с доступом на интернет")
                break
            }
            
        }
    
    }
        
        
}

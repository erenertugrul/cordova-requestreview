import StoreKit

@objc(RequestReview) class RequestReview : CDVPlugin {
  @objc(requestReview:)
  func requestReview(command: CDVInvokedUrlCommand) {
        func basarili(yazi: String)
        {
            let sonuc = CDVPluginResult(
                status: CDVCommandStatus_OK,
                messageAs: yazi
            )
            self.commandDelegate.send(
                sonuc,
                callbackId: command.callbackId
            )
        }
    
        func hatali(yazi: String)
        {
            let sonuc = CDVPluginResult(
                status: CDVCommandStatus_ERROR,
                messageAs: yazi
            )
            self.commandDelegate.send(
                sonuc,
                callbackId: command.callbackId
            )
        }
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
            basarili(yazi: "gösterildi")
        }
        else{
            hatali(yazi: "ios sürümü 10.3 den yüksek olmalı")
        }
    }
    @objc(writeReview:)
    func writeReview(command: CDVInvokedUrlCommand) {
        func basarili(yazi: String)
        {
            let sonuc = CDVPluginResult(
                status: CDVCommandStatus_OK,
                messageAs: yazi
            )
            self.commandDelegate.send(
                sonuc,
                callbackId: command.callbackId
            )
        }
        
        func hatali(yazi: String)
        {
            let sonuc = CDVPluginResult(
                status: CDVCommandStatus_ERROR,
                messageAs: yazi
            )
            self.commandDelegate.send(
                sonuc,
                callbackId: command.callbackId
            )
        }
        
        let uygulama_id = command.arguments[0] as? String ?? ""
        if (uygulama_id == ""){
            hatali(yazi: "uygulama id'si yok")
            return
        }

        if #available(iOS 10.3, *) {
            
            if let url = URL(string: "https://itunes.apple.com/us/app/"+uygulama_id+"?action=write-review"){
                UIApplication.shared.open(url,options: [:],completionHandler: {(result) in
                    if result{
                        basarili(yazi: "site açıldı")
                    }
                    else{
                        hatali(yazi: "site açılmadı")
                    }
                })
            }
        }
        else{
            hatali(yazi: "ios sürümü 10.3 den yüksek olmalı")
        }

    }
}

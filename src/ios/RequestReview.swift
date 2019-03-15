import StoreKit

@objc(RequestReview) class RequestReview : CDVPlugin
{
    private func basarili(yazi: String, command: CDVInvokedUrlCommand)
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
    
    private func hatali(yazi: String, command: CDVInvokedUrlCommand)
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
    
    @objc(requestReview:)
    func requestReview(command: CDVInvokedUrlCommand)
    {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
            self.basarili(yazi: "gösterildi",command: command)
        }
        else{
            self.hatali(yazi: "ios sürümü 10.3 den yüksek olmalı",command: command)
        }
    }
    
    
    @objc(writeReview:)
    func writeReview(command: CDVInvokedUrlCommand)
    {
        let uygulama_id = command.arguments[0] as? String ?? ""
        if (uygulama_id == ""){
            self.hatali(yazi: "uygulama id'si yok",command: command)
            return
        }
        
        if #available(iOS 10.3, *) {
            
            if let url = URL(string: "https://itunes.apple.com/us/app/"+uygulama_id+"?action=write-review"){
                UIApplication.shared.open(url,options: [:],completionHandler: {(result) in
                    if result{
                        self.basarili(yazi: "site açıldı",command: command)
                    }
                    else{
                        self.hatali(yazi: "site açılmadı",command: command)
                    }
                })
            }
        }
        else{
            self.hatali(yazi: "ios sürümü 10.3 den yüksek olmalı",command: command)
        }
        
    }
    
    
}

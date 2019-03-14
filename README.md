# cordova-requestreview
cordova ios requestreview plugin


#### Basit kullanım

* oylama penceresi açar
```javascript
cordova.plugin.requestreview.postreview();
```
*görüş yazmak için app linkini açar
```javascript
cordova.plugin.requestreview.postwrite("app_id");
```

#### callback'lı kullanım şekli

```javascript
var callback = function (hata, sonuc){
    if (hata){
        console.log(hata)
    }
    else{
        console.log(sonuc)
    }
}

cordova.plugin.requestreview.postreview(callback);

cordova.plugin.requestreview.postwrite("app_id",callback);
```

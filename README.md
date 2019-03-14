# cordova-requestreview
cordova ios requestreview plugin


#### Basit kullanım

* oylama penceresi açar
```javascript
cordova.plugins.RequestReview.postreview();
```
* görüş yazmak için app linkini açar
```javascript
cordova.plugins.RequestReview.postwrite("app_id");
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

cordova.plugins.RequestReview.postreview(callback);

cordova.plugins.RequestReview.postwrite("app_id",callback);
```

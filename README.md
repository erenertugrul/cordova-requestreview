# cordova-requestreview
cordova ios requestreview plugin

![requestreview ios](https://i.imgur.com/3NMRuTN.png)

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
var callback = function (error, result){
    if (error){
        console.log(error)
    }
    else{
        console.log(result)
    }
}

cordova.plugins.RequestReview.postreview(callback);

cordova.plugins.RequestReview.postwrite("app_id",callback);
```

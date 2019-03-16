# cordova-requestreview
cordova ios requestreview plugin

![requestreview ios](https://i.imgur.com/3NMRuTN.png)

#### simple use

* ask the user to rate
```javascript
cordova.plugins.RequestReview.postreview();
```
* open a page on which users can write a review in the App Store
```javascript
cordova.plugins.RequestReview.postwrite("app_id");
```

#### use with callback

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

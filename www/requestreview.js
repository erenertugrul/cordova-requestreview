
var exec = require('cordova/exec');

exports.postreview = function(sonuc) {
   function basarili (gelen)
   {
       sonuc(null,gelen);
   }
   function hatali (gelen)
   {
       sonuc(gelen,null);
   }
    exec(basarili, hatali, "RequestReview", "requestReview");
};
exports.postwrite = function(uygulama_id,sonuc) {
   function basarili (gelen)
   {
       sonuc(null,gelen);
   }
   function hatali (gelen)
   {
       sonuc(gelen,null);
   }
    var args = [uygulama_id];
    exec(basarili, hatali, "RequestReview", "writeReview",args);
};


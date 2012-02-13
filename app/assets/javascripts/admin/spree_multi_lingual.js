//= require admin/spree_core

$(document).ready(function(){
  $("#spree_multi_lingual_dropdown").change(function(e){
//    alert("ok");
    $("input[name='translated_fields']").each(function(index, field){
      alert($(field).val());
    });
  });
});


var SpreeMultiLingual = {}
(SpreeMultiLingual = function () {
    
    SpreeMultiLingual.change_language = function () {
      
    }
    
    SpreeMultiLingual.duplicate_fields = function(){
      
    }
    
    SpreeMultiLingual.fields_exists_for_language = function(){
      
    }
})();
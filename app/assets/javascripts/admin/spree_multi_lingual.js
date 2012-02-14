//= require admin/spree_core
//= require admin/spree_multi_lingual_class


// $(document).ready(function(){
//   
//   $("#spree_multi_lingual_dropdown").change(function(e){
//     SpreeMultiLingual.change_language();
//   });
// });


// var SpreeMultiLingual = {};
// (SpreeMultiLingual = function () {
//     SpreeMultiLingual.translated_fields = [];
//     
//     SpreeMultiLingual.change_language = function () {
//       set_translated_fields();
//       for_each_field(function(field){
//         alert(field);
//       });
//     }
//     
//     SpreeMultiLingual.duplicate_fields = function(){
//       
//     }
//     
//     SpreeMultiLingual.field_exists_for_language = function(){
//       
//     }
//     
//     set_translated_fields = function(){
//       if(SpreeMultiLingual.translated_fields.length == 0){
//         $("input[name='translated_fields']").each(function(i, field){
//           SpreeMultiLingual.translated_fields[i] = $(field).val();
//         });
//       }
//     }
//     
//     for_each_field = function(callback){
//       for(var i = 0; i > SpreeMultiLingual.translated_fields.length; i++){
//         eval(callback + "(" + SpreeMultiLingual.translated_fields[i] + ")");
//       }
//     }
// })();
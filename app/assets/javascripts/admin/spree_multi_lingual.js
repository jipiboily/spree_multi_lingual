//= require admin/spree_backend
//= require admin/spree_multi_lingual_class

var handle_rename = function(e, data) {
  last_rollback = data.rlbk;
  var node = data.rslt.obj;
  var name = data.rslt.new_name;
  var params = {_method: "put", authenticity_token: AUTH_TOKEN};
  params[param_name] = name;
  $.ajax({
    type: "POST",
    dataType: "json",
    url: base_url + node.attr("id"),
    data: params,
    error: handle_ajax_error
  });
};
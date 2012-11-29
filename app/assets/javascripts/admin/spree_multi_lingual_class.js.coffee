$(document).ready ->
  $("#spree_multi_lingual_dropdown").change (e) ->
    ml = new SpreeMultiLingual
    ml.change_language(@.value)

# declare the class in global scope so we can extend it from within our app
class window.SpreeMultiLingual
  constructor: ->
    @translated_fields = window.spree_multi_lingual.translated_fields
    @default_locale = window.spree_multi_lingual.backend_locale
    @current_locale = @default_locale
    
  change_language: (locale) =>
    @current_locale = locale
    @make_sure_field_exists_for_language()
    @show_fields()

  duplicate_field: (field) =>
    field_name = @localized_field_name(field)    
    
    if $("#" + field)[0]
      
      new_field_name_value = $("#" + field).attr("name").substring(0,$("#" + field).attr("name").length - 1) + "_" + @current_locale + "]"
      
      # adapted to use redactorjs editor
      if field == 'product_description' || field == 'page_body'
        
        new_field = $("#" + field).clone().attr("id", field_name).attr("name", new_field_name_value).removeClass("sml-localized-field-" + @default_locale).addClass("redactor").addClass("redactor-#{@current_locale}").removeClass("redactor-#{@default_locale}")
      else
        new_field = $("#" + field).clone().attr("id", field_name).attr("name", new_field_name_value).removeClass("sml-localized-field-" + @default_locale)
      
      
      value = eval("window.spree_multi_lingual.translated_fields_values['#{field_name}']")
      new_field.val(value) if value

      $("#" + field).parent().after(new_field)
      @add_localized_class(field_name)
      @add_localized_class(field, @default_locale)

        
  make_sure_field_exists_for_language: =>
    for field in @translated_fields
      field_name = @localized_field_name(field)
      if !$("#" + field_name).length
        @duplicate_field(field)

  show_fields: =>
    csrf_token = $('meta[name=csrf-token]').attr('content');
    csrf_param = $('meta[name=csrf-param]').attr('content');
        
    # adapted to use redactorjs editor
    $(".sml-localized-field").hide()
    $(".redactor").hide().parent('div.redactor_box').hide()
    
    $(".sml-localized-field-#{@current_locale}").show()
    $("textarea.sml-localized-field-#{@current_locale}").hide()  
    
    $(".redactor-#{@current_locale}").parent('div.redactor_box').show()
    
    if (csrf_param != undefined && csrf_token != undefined)
      params = csrf_param + "=" + encodeURIComponent(csrf_token)
    
    $(".redactor-#{@current_locale}").redactor({ 
        imageUpload   : "/redactor_rails/pictures?#{params}",
        imageGetJson  : "/redactor_rails/pictures",
        path          : "/assets/redactor-rails",
        css           : "style.css",
        autoresize    : true,
        minHeight     : 350
      });
        

  localized_field_name: (field) =>
    return (field + "_" + @current_locale) if @current_locale isnt @default_locale
    field

  add_localized_class: (id, locale = @current_locale) =>
    @add_class(id, "sml-localized-field")
    @add_class(id, "sml-localized-field-" + locale)

  add_class: (id, klass) ->
    $("#" + id).addClass(klass) unless $("#" + id).hasClass(klass)
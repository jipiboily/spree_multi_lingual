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
    new_field_name_value = $("#" + field).attr("name").substring(0,$("#" + field).attr("name").length - 1) + "_" + @current_locale + "]"
    new_field = $("#" + field).clone().attr("id", field_name).attr("name", new_field_name_value).removeClass("sml-localized-field-"+@default_locale)
    value = eval("window.spree_multi_lingual.translated_fields_values['#{field_name}']")
    new_field.val(value) if value
    $("#" + field).after(new_field)
    @add_localized_class(field_name)
    @add_localized_class(field, @default_locale)

  make_sure_field_exists_for_language: =>
    for field in @translated_fields
      field_name = @localized_field_name(field)
      if !$("#" + field_name).length
        @duplicate_field(field)

  show_fields: =>
    $(".sml-localized-field").hide()
    $(".sml-localized-field-#{@current_locale}").show()

  localized_field_name: (field) =>
    return (field + "_" + @current_locale) if @current_locale isnt @default_locale
    field

  add_localized_class: (id, locale = @current_locale) =>
    @add_class(id, "sml-localized-field")
    @add_class(id, "sml-localized-field-" + locale)

  add_class: (id, klass) ->
    $("#" + id).addClass(klass) unless $("#" + id).hasClass(klass)
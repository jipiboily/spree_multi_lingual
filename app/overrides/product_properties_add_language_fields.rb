language_fields = ""
language_fields_headers = "<th><%= t(:property) %></th>"
SpreeMultiLingual.languages.each do |lang|
  language_fields += "
  <td class='value'>
    <%= f.text_field :value_#{lang}, :class => 'autocomplete' %>
  </td>"
  language_fields_headers += "
  <th><%= t(:value) %> (#{lang})</th>"
end
language_fields_headers += "
<th><%= t(:action) %></th>"

Deface::Override.new(
:virtual_path => "spree/admin/product_properties/_product_property_fields",
:replace => "td.value",
:text         => language_fields,
:name         => "product_properties_add_language_fields"
)
Deface::Override.new(
  :virtual_path => "spree/admin/product_properties/index",
  :replace_contents => "[data-hook='product_properties_header']",
  :text         => language_fields_headers,
  :name         => "product_properties_add_language_fields_headers"
)
# Deface::Override.new(
#   :virtual_path => "spree/admin/product_properties/index",
#   :replace => "code[erb-loud]:contains('render :partial => \'product_property_fields\', :locals => { :f => pp_form }')",
#   :text         => "<%= render :partial => 'product_property_fields', :locals => { :f => pp_form, :pp =>  } %>",
#   :name         => "product_properties_add_language_dropdown"
# )
# 
# 

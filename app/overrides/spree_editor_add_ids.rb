text = ''
SpreeMultiLingual.languages.each do |lang|
  text += "<%   
  ids_extra = []
  ids.each do |id|
    ids_extra << id + '_#{lang}'
  end
  ids += ids_extra
  %>"
end

Deface::Override.new(
:virtual_path  => "shared/_rich_editor_javascript",
:insert_after => "code[erb-silent]:contains('ids = @editor_configuration[:ids].split')",
:text => text,
:name    => "add_ids_in_spree_editor_for_multi_lingual")
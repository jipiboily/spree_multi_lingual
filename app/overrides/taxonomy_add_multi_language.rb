Deface::Override.new(
        :virtual_path  => "spree/admin/taxonomies/edit",
        :replace => "code[erb-loud]:contains('t(:taxonomy_edit)')",
        :name    => "taxonomies_add_multi_language",
        :partial => "spree/admin/taxonomies/multi_language_links")
Deface::Override.new(
        :virtual_path  => "spree/admin/taxonomies/edit",
        :replace => "code[erb-loud]:contains('t(:taxonomy_edit)')",
        :name    => "taxonomies_add_multi_language",
        :partial => "spree/admin/taxonomies/multi_language_links")

Deface::Override.new(
        :virtual_path  => "spree/admin/taxons/edit",
        :insert_after => "h1",
        :text => '<%= render "spree/admin/shared/language_dropdown", :object => @taxon -%>',
        :name    => "taxon_add_language_dropdown")
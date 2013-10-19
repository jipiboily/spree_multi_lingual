Deface::Override.new(
        :virtual_path  => "spree/admin/taxonomies/edit",
        :replace => "code[erb-loud]:contains('t(:taxonomy_edit)')",
        :name    => "taxonomies_add_multi_language",
        :partial => "spree/admin/taxonomies/multi_language_links")

Deface::Override.new(
        :virtual_path  => "spree/admin/taxons/_form",
        :insert_top => '[data-hook="admin_inside_taxon_form"]',
        :text => ' <div class="alpha twelve columns">
        <%= render "spree/admin/taxons/multi_scripts", :object => @taxon -%>
        </div>',
        :name    => "taxon_add_language_dropdown")
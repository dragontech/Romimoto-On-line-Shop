module TaxonsHelper
  def breadcrumbs(taxon, separator="&nbsp;&raquo;&nbsp;")
    return "" if current_page?("/")
    separator = raw(separator)
    crumbs = [content_tag(:li, link_to(t(:home) , root_path) + separator)]
    if taxon
      crumbs << content_tag(:li, link_to(t('products') , products_path) + separator)
      crumbs << taxon.ancestors.collect { |ancestor| content_tag(:li, link_to(ancestor.name , seo_url(ancestor)) + separator) } unless taxon.ancestors.empty?
      crumbs << content_tag(:li, link_to(taxon.name , seo_url(taxon)))
    else
      crumbs << content_tag(:li, content_tag(:span, t('products')))
    end
    crumb_list = content_tag(:ul, raw(crumbs.flatten.map{|li| li.mb_chars}.join))
    content_tag(:div, crumb_list + tag(:br, {:class => 'clear'}, false, true), :class => 'breadcrumbs')
  end

end

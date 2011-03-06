module ApplicationHelper
  def languages_bar
    html = '<ul>'
    LANGUAGES.each{|lang| html += "<li #{I18n.locale.to_s == lang[1] ? 'id="current"' : ''}>#{link_to(lang[1].upcase, url_for(:locale => lang[1]))}</li>"}
    html += '</ul>'
    html.html_safe
  end

  def img_link_to_cart(text = t('cart'))
    return "" if current_page?(cart_path)
    css_class = nil
    if current_order.nil? or current_order.line_items.empty?
      text = "#{text}: [#{t('empty')}]"
      css_class = 'empty'
    else
      text = "#{text}: (#{current_order.item_count}) #{order_price(current_order)}"
      css_class = 'full'
    end
    (text + link_to(image_tag('go1.png'), cart_path, :class => css_class)).html_safe
  end
end

module Cavy
  module ViewHelpers

    ##
    # This method makes a editable page element
    #
    #
    # = Example
    #
    #   page_element(id: 'title', content: @page.title)

    def page_element(opts) # :args: id, content
      "<div id='#{opts[:id]}' data-mercury='full'>#{opts[:content]}</div>".html_safe
    end

    ##
    # This method makes a localized editable page element
    #
    #
    # = Example
    #
    #   localized_page_element(id: 'title', page: @page)

    def localized_page_element(opts) # :args: id, page
      page_element(id: localized_title(opts[:id]), content: opts[:page].page_elements[localized_title(opts[:id])])
    end

    ##
    # This method gives the user SEO meta tags
    #
    # = Example
    #
    #   meta_tags(page)

    def meta_tags(page)
      return "<meta content='#{page.description}' name='description'> <meta content='#{page_tags(page)}' name='keywords'>".html_safe
    end

    ##
    # This method creates a chart tag for the charts api´
    #
    # = Example
    #
    #   chart_tag ('page_vies', 300)
    def chart_tag (action, height, params = {})
      params[:format] ||= :json
      path = url_for controller: :statistics, action: action
      
      content_tag(:div, :'data-chart' => path, :style => "height: #{height}px;") do
        image_tag('', :size => '24x24', :class => 'spinner')
      end
      
    end

    private

    def localized_title(id)
      "#{id}_#{I18n.locale}"
    end

    def page_tags(page)
      page.tags ? page.tags.join(', ') : ''
    end

  end
end
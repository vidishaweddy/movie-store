module AdminHelper
  def sort_link(collection, key, text=nil, &block)
    new_params = params.dup.permit!
    new_params.delete(:reverse_order)
    new_params.delete(:page)
    new_params[:sort] = key

    link_options = { remote: true }
    link_options[:style] = 'display:block'

    if collection && !collection.valid_sort_option?(key)
      raise ArgumentError, "Unknown sort_option #{key.to_s.inspect} for #{collection.model_name}"
    end

    # We get the current sorting info from the collection, rather than
    # params, so we know what's going on when the params don't say
    # anything, and the default order has been applied.
    current_sort, current_reverse = collection && collection.respond_to?(:last_user_sort) && collection.last_user_sort

    if block_given?
      raise ArgumentError, "Can't supply a string and a block" unless text.nil?
      text = capture(&block)
    else
      text ||= collection.human_attribute_name(key)
    end

    if current_sort == key.to_s
      new_params[:reverse_order] = true unless current_reverse
      current_dir = current_reverse ? 'desc' : 'asc'
      link_to(text, new_params, link_options.merge(data: { current: current_dir }))
    else
      link_to(text, new_params, link_options)
    end
  end
end

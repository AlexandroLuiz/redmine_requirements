 module GlobalHelper

  def link_to_edit(url = {},authorized_options = {}, html_options = {})
      link_to_if_authorized(l(:button_update), url, authorized_options, html_options)
  end

  def link_to_destroy(url = {}, authorized_options = {}, html_options = {})
     link_to_if_authorized(l(:button_delete), url, authorized_options, html_options)
  end

  def link_to_new(model, url = {}, authorized_options = {}, html_options = {})
    link_to_if_authorized(t("new", :model => t(model.name)), url, authorized_options, html_options)
  end

  def link_to_list(model, url = {}, authorized_options = {}, html_options = {})
    link_to_if_authorized(t("list", :model => t("#{model.name}s")), url, authorized_options, html_options)
  end

  def evident_or_hidden(hidden)
    if hidden
      t "hidden"
    else
     t "evident"
   end
  end

  def convert_true_to_X(value)
    if value == true
      "X"
    else
      " "
    end
  end

  def desirable_or_required(value)
    if value
      t "desirable"
    else
     t "required"
   end
  end

  def permanent_or_transitional(value)
    if value
      t "permanent"
    else
     t "transit"
   end
  end

 end


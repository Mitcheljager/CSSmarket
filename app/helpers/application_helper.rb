module ApplicationHelper
  def active_class_for(classname, path)
    "#{classname}" if current_page?(path)
  end
end

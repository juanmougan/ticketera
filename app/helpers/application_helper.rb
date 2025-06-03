module ApplicationHelper
  # Properly fills a <select> element
  def enum_options_for_select(klass, enum)
    klass.send(enum.to_s.pluralize).map { |s| [ s[0].humanize, s[1].to_i ] }
  end
end

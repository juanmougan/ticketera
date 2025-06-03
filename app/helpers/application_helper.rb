module ApplicationHelper
  # TODO see if this is needed
  def enum_options_for_select(klass, enum)
    klass.send(enum.to_s.pluralize).map { |key, value| [ key.humanize, value.to_i ] }
  end
end

module BoardsHelper
  def render_field(form, attribute, label, options = {})
    content_tag(:div, class: "form-group") do
      concat(form.label(attribute, label))
      concat(form.send(input_type(attribute), attribute, class: "form-control", **options))
      if @board.errors.has_key?(attribute)
        concat(content_tag(:small, class: "text-danger") { @board.errors[attribute].first })
      end
    end
  end

  def input_type(attribute)
    attribute.to_s.include?("email") ? :email_field : :text_field
  end
end

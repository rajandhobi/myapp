class LabellingFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options = {})
    # 1. First add label
    # 2. Then add original Rails text_field
    label(attribute) + super
  end
end

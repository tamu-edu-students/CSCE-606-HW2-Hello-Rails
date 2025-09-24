module MoviesHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "sorted-by #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    arrow_symbol = (column == sort_column) ? (sort_direction == "asc" ? "▲" : "▼") : nil
    link_text = safe_join([title, content_tag(:span, arrow_symbol, class: 'sort-arrow')])
    
    link_to link_text, { sort: column, direction: direction }, { class: css_class }
  end
end
module CommentsHelper
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      content_tag(:div, render("posts/comments/index", comment: comment), class: "ms-4")
    end.join.html_safe
  end
end

# frozen_string_literal: true

module Posts::CommentsHelper
  def nested_comments(comments)
    comments.map do |comment|
      if comment.has_parent?
        content_tag(:div, render('posts/comments/index', comment: comment), class: 'ms-4')
      else
        render 'posts/comments/index', comment: comment
      end
    end.join
  end
end

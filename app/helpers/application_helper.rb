module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def notify
    notice if notice.present?
    alert if alert.present?
  end

  def sign_navbar
  concat link_to 'Sign in', user_session_path unless current_user

      concat 'Hello,'
      concat link_to content_tag(:strong, current_user.name.upcase), user_path(current_user), class: ''
      concat link_to 'Sign out', destroy_user_session_path, method: :delete 
  end 
end

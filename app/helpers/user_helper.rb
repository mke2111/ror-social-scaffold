module UserHelper
  
  def check_status(user)
    if !current_user.pending_friends.include?(user) && !user.pending_friends.include?(current_user)
        false
      elsif current_user.pending_friends.include?(user) || user.pending_friends.include?(current_user)
        true
      end
  end

  def friendship?(user)
    if check_status(user) == false && current_user != user && !current_user.friends.include?(user)
      concat link_to 'Add as friend', user_friendships_path(current_user, friendship: { friend_id: user.id }),
                     method: :post, class: 'btn-1 green_btn'
    elsif current_user.pending_friends.include?(user) || current_user.friend_requests.include?(user)
      concat content_tag(:p, 'Waiting for confirmation.', class: 'label info')
    elsif current_user != user
      concat content_tag(:p, 'You are already friends.', class: 'label success')
    end
  end
end

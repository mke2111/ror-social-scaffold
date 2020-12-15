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
    elsif check_status(user) == true
      concat content_tag(:p, 'Waiting for confirmation.', class: 'label info')
    elsif current_user != user
      concat content_tag(:p, 'You are already friends.', class: 'label success')
    end
  end

  def action_request(friend_request)
    concat content_tag(:p, "You haven't received any friend request yet.") unless current_user.friend_requests.any?
    friend_request.each do |user|
      next if current_user.friend?(user)

      concat user.name
      concat link_to 'Accept', user_friendship_path(@friend_requests, user), method: :put,
                                                                             class: 'btn-1 green_btn mx-10'
      concat link_to 'Reject', user_friendship_path(@friend_requests, user), method: :delete,
                                                                             class: 'btn-1 red_btn mx-10'
    end
  end

  def action_pending(pending_request)
    concat 'No pending confirmations' unless current_user.friend?(pending_request)
    pending_request.each do |user|
      next if current_user.friend?(user)

      concat content_tag(:li)
      concat 'Waiting friend confirmation from '
      concat content_tag(:strong, user.name)
    end
  end
end

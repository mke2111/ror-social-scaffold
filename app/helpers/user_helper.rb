module UserHelper
 def is_friendship?(user)
    if current_user.friends.none?(user) && current_user.pending_friends.none?(user) && current_user.friend_requests.none?(user) && current_user != user
        concat link_to("Add as friend", user_friendships_path(current_user, :friendship => {:friend_id => user.id}), class: 'btn-1 green_btn')
      #<%= link_to 'Add as friend', user_friendships_path(current_user, :friendship => {:friend_id => user.id}), method: :post, class: 'btn-1 green_btn' %>.html_safe
    elsif (current_user.pending_friends.include?(user) || current_user.friend_requests.include?(user))
      simple_format('Waiting for confirmation.', class: 'btn-1 green_btn')
    elsif current_user != user
      simple_format("You are already friends.", class: 'btn-1 green_btn')
    end
 end
end
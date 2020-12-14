class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
    @friendship = current_user.friendships.build
  end

  def index
    @friendship = current_user.friendships.build(friendship_params)
  end

  def create
    @friendship = current_user.friendships.build(friendship_params)
    if @friendship.save
      flash[:notice] = 'Friend Request sent'
      redirect_to users_path
    else
      flash[:notice] = 'Error on Friend Request'
    end
  end

  def update
    user = User.find(params[:user_id])
    if current_user.friend_requests
      current_user.confirm_friend(user)
      flash[:notice] = 'Friendship accepted'
      redirect_to users_path
    else
      flash[:notice] = 'Error accepting friendship'
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end

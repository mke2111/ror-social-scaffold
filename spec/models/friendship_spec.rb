require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:friend).class_name('User') }
  end

  # describe 'Create a like' do
  #   let(:testuser) { User.create(name: 'lalo', email: 'lalo@microverse.org', password: '123456789') }
  #   let(:testuser2) { User.create(name: 'roy', email: 'roy@microverse.org', password: '987654321') }
  #   subject { Friendship.create(user_id: testuser.id, friend_id: testuser2.id, confirmed: true) }

  #   it 'change the count of friendship by one' do
  #     expect { subject }.to change { Friendship.count }.by(1)
  #   end
  # end
end

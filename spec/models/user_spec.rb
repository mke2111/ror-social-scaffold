require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts).class_name('Post') }
    it { should have_many(:comments).class_name('Comment') }
    it { should have_many(:likes) }
    it { should have_many(:friendships).class_name('Friendship') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end

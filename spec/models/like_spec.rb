require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:post).class_name('Post') }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:post_id) }
  end
end

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belongs_to(:user).class_name('User') }
    it { should belongs_to(:post).class_name('Post') }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
  end
end

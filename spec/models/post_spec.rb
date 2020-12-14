require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:comments).class_name('Comment') }
    it { should have_many(:likes)}
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
  end
end

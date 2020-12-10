require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'associations' do
    it { should belongs_to(:user).class_name('User') }
    it { should belongs_to(:friend).class_name('Friend') }
  end

end

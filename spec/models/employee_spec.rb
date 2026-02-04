require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'associations' do
    it { should belong_to(:department) }
  end

  describe 'validations' do
    it { should validate_presence_of(:department) }
  end
end
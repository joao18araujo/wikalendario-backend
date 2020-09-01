require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:department) }
    it { is_expected.to belong_to(:semester) }
  end
end

require 'rails_helper'

RSpec.describe Campus, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:university) }
    it { is_expected.to have_many(:courses) }
    it { is_expected.to have_many(:departments) }
  end
end

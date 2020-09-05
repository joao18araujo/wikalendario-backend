require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:start_time) }
    it { is_expected.to validate_presence_of(:end_time) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:subject_classes) }
  end
end

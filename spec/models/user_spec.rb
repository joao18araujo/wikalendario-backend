require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value('joao_araujorbd').for(:nickname) }
    it { is_expected.to_not allow_value('joao/araujo').for(:nickname) }
    it { is_expected.to allow_value('joao_araujorbd@yahoo.com.br').for(:email) }
    it { is_expected.to_not allow_value('joao/araujo.com').for(:email) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:course) }
  end
end

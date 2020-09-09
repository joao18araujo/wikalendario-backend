require 'rails_helper'

RSpec.describe "/subjects", type: :request do
  describe "GET /subjects/:id" do
    let!(:subject) { create(:subject) }
    let(:user) { create(:user) }
    let(:token) { create_token(user) }

    before do
      FactoryBot.create :subject_class, subject: subject
      get subject_path(subject), headers: { Authorization: token }, as: :json
    end

    it 'should return status 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return selected' do
      expect(response_body['id']).to eq(subject.id)
    end

    it 'should return subjects params and associations' do
      expect(response_body).to include('id', 'name', 'subject_classes')
    end

    it 'should return subject classes params and associations' do
      expect(response_body['subject_classes'][0]).to include('id', 'name', 'schedules')
    end
  end
end

require 'rails_helper'

RSpec.describe "/campi", type: :request do
  describe "GET /campi/:id" do
    let!(:campus) { create(:campus) }
    let(:user) { create(:user) }
    let(:token) { create_token(user) }

    before do
      get campus_path(campus), headers: { Authorization: token }, as: :json
    end

    it 'should return status 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return selected' do
      expect(response_body['id']).to eq(campus.id)
    end

    it 'should return campus params and associations' do
      expect(response_body).to include('id', 'name', 'courses', 'departments')
    end
  end
end

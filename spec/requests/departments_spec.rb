require 'rails_helper'

RSpec.describe "/departments", type: :request do
  describe "GET /departments/:id" do
    let!(:department) { create(:department) }
    let(:user) { create(:user) }
    let(:token) { create_token(user) }

    before do
      get department_path(department), headers: { Authorization: token }, as: :json
    end

    it 'should return status 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return selected' do
      expect(response_body['id']).to eq(department.id)
    end

    it 'should return department params and associations' do
      expect(response_body).to include('id', 'name', 'subjects')
    end
  end
end

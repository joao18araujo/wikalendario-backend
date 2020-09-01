require 'rails_helper'

RSpec.describe "/subjects", type: :request do
  describe "GET /subjects/:id" do
    let!(:subject) { create(:subject) }

    before do
      get subject_path(subject), as: :json
    end

    it 'should return status 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return selected' do
      expect(response_body['id']).to eq(subject.id)
    end

    it 'should return subjects params and associations' do
      expect(response_body).to include('id', 'name')
    end
  end
end

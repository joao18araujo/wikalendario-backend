require 'rails_helper'

RSpec.describe "Universities", type: :request do
  describe "GET /universities" do
    let!(:university) { create(:university) }

    before do
      get universities_path, as: :json
    end

    it 'should return status 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return all universities' do
      expect(response_body.size).to eq(University.count)
    end

    it 'should return universities params' do
      expect(response_body[0]).to include('id', 'name')
    end

    it 'should not return universities associations' do
      expect(response_body[0]).not_to include('current_semester', 'campi')
    end
  end

  describe "GET /universities/:id" do
    let!(:university) { create(:university) }

    before do
      get university_path(university), as: :json
    end

    it 'should return status 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return selected' do
      expect(response_body['id']).to eq(university.id)
    end

    it 'should return university params and associations' do
      expect(response_body).to include('id', 'name', 'current_semester', 'campi')
    end
  end
end

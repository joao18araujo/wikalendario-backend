require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/campi", type: :request do
  describe "GET /campi" do
    let!(:campus) { create(:campus) }

    before do
      get campi_path, as: :json
    end

    it 'should return status 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return all campi' do
      expect(response_body.size).to eq(Campus.count)
    end

    it 'should return campi params' do
      expect(response_body[0]).to include('id', 'name')
    end

    it 'should not return campi associations' do
      expect(response_body[0]).not_to include('courses', 'departments')
    end
  end

  describe "GET /campi/:id" do
    let!(:campus) { create(:campus) }

    before do
      get campus_path(campus), as: :json
    end

    it 'should return status 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return selected' do
      expect(response_body['id']).to eq(campus.id)
    end

    xit 'should return campus params and associations' do
      expect(response_body).to include('id', 'name', 'university', 'courses', 'departments')
    end
  end
end

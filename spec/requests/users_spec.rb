require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST /users/sign_up' do
    let(:course) { create :course }
    
    context 'when params are valid' do
      let(:valid_params) do
        {
          user: {
            nickname: 'joao_araujo',
            password: '123456',
            password_confirmation: '123456',
            course_id: course.id,
            name: 'Joao Vitor Araujo',
            email: 'joao_araujo@gmail.com'
          }
        }
      end

      subject(:create_user) do
        post user_sign_up_path, params: valid_params, as: :json
      end

      it 'should create an user' do
        expect do
          create_user
        end.to change(User, :count).by(1)
      end

      it 'should return 200 status' do
        create_user
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when params are invalid' do
      let(:invalid_params) do
        {
          user: {
            nickname: 'joao_araujo',
            password: '12',
            password_confirmation: '123456',
            course_id: course.id,
            name: 'Joao Vitor Araujo',
            email: 'joao_araujo@gmail.com'
          }
        }
      end

      subject(:create_user) do
        post user_sign_up_path, params: invalid_params, as: :json
      end

      it 'should not create an user' do
        expect do
          create_user
        end.not_to change(User, :count)
      end

      it 'should return error message' do
        create_user
        expect(response_body).to include('status', 'error')
      end

      it 'should return 422 status' do
        create_user
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'POST /users/sign_in' do
    context 'when params are valid' do
        let(:valid_params) do
        {
          email: 'joao_araujo@gmail.com',
          password: '06bisonho'
        }
      end

      before do
        FactoryBot.create(:user, email: 'joao_araujo@gmail.com')
        post user_sign_in_path, params: valid_params, as: :json
      end

      it 'should return 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'should return tokens' do
        expect(response.headers).to include('Access-Token')
      end
    end

    context 'when params are invalid' do
      let(:invalid_params) do
      {
        email: 'joao_araujo@gmail.com',
        password: '1234567'
      }
    end

    before do
      post user_sign_in_path, params: invalid_params, as: :json
    end

    it 'should return 422 status' do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'should not return tokens' do
        expect(response.headers).not_to include('Access-Token')
    end

    it 'should return error message' do
      expect(response_body).to include('status', 'error')
    end
  end
  end
end

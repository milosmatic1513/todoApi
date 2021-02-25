require'rails_helper'

RSpec.describe 'Todos_API', type: :request do
  let(:user){create(:user)}

  #Post /login test suite
  describe 'POST /login' do

    let(:name) { "User Spec name" } #bug fix

    # valid payload
    let(:valid_attributes){{ email: user.email, password: user.password }}

    context 'when the request is valid' do

      before { post '/login', params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

    end

    context 'when the request is invalid' do

      before { post '/login', params:{}}

      it 'returns status code 403' do
        expect(response).to have_http_status(403)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match("{\"message\":\"Username Or Password Incorect\"}")
      end

    end
  end

  #Post /sign_up test suite
  describe 'POST /signup' do

    let(:name) { "User Spec name" } #bug fix

    # valid payload
    let(:valid_attributes){{ email: "foo@bar.com", password: user.password }}

    context 'when the request is valid' do
      before { post '/signup', params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

    end

    context 'when the request is invalid' do

      before { post '/login', params:{}}

      it 'returns status code 403' do
        expect(response).to have_http_status(403)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match("{\"message\":\"Username Or Password Incorect\"}")
      end

    end

  end

  #DELETE /logout test suite
  describe 'DELETE /logout' do

    let(:name) { "User Spec name" } #bug fix

    context 'when the request is valid' do

      before { delete '/logout' }


      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end

  end

end

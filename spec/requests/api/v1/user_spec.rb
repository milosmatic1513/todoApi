require 'swagger_helper'

RSpec.describe 'todos', type: :request do

  #Method : Post
  #Path   :/signup/
  #Title  :Sign up user

  path "/signup/" do
    post 'Sign up user' do
      tags 'User'
      consumes "application/json" , "application/xml"
      parameter  in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: ["email", "password"],
      }
      #response created

      response "201", "User Created" do
        run_test!
      end

      #response failed
      response "422", "Invalid request" do
        run_test!
      end
    end
  end

  #Method :Post
  #Path   :/login/
  #Title  :login User

  path "/login/" do
    post 'Login user' do
      tags 'User'
      consumes "application/json" , "application/xml"
      parameter  in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: ["email", "password"],
      }
      #response created

      response "201", "User Successfully Loged In" do
        run_test!
      end

      #response failed
      response "401", "Invalid request" do
        run_test!
      end
    end
  end

  #Method :Get
  #Path   :/logged_in/
  #Title  :Check if users is logged_in

  path "/logged_in/" do
    get 'Check If Logged In' do
      tags 'User'

      #response created

      response "200", "User Loged In" do
        run_test!
      end

      #response failed
      response "401", "Invalid request" do
        run_test!
      end
    end
  end

  #Method :Delete
  #Path   :/logout/
  #Title  :logs user out
  path "/logout/" do
    delete 'Log User Out' do
      tags 'User'

      #response created

      response "200", "User Logged Out" do
        run_test!
      end

    end
  end
end

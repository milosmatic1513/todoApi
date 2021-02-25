require 'swagger_helper'

RSpec.describe 'todos', type: :request do

  #Method : Get
  #Path   :/todos/
  #Title  :Retrieve all todos
  path "/todos/" do
    get 'Retrieve all todos ( INDEX )' do
      tags 'Todo'
      produces 'application/json'
      response '200', 'Todos found' do
        schema type: :object,
          properties: {
            title: { type: :string, },
            created_by: { type: :string },
            user_id: { type: :string }
          },
          required: [ 'title', 'created_by','user_id' ]



      end
      response '403', 'Forbidden Access' do
        schema type: :object,
          properties: {
            message: { type: :string, },

          }

      end
    end
  end

  #Method : Post
  #Path   :/todos/
  #Title  :Create a Todo
  path "/todos" do
    post "Create a Todo ( CREATE )" do
      tags "Todo"
      consumes "application/json" , "application/xml"
      parameter  in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
        },
        required: ["title"],
      }

      #response created

      response "201", "Todo created" do

      end

      #forbidden access

      response '403', 'Forbidden Access' do

      end

      #response failed
      response "422", "Invalid request" do

      end
    end
  end

  #Method : Get
  #Path   :/todos/{id}
  #Title  :Retrieve a specific todo

  path '/todos/{id}' do
    get 'Retrieves a todo ( SHOW )' do
      tags 'Todo'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      #response ok

      response '200', 'Todo found' do
        schema type: :object,
          properties: {
            title: { type: :string, },
            created_by: { type: :string },
            user_id: { type: :string }
          },
          required: [ 'title', 'created_by','user_id' ]

      end

      #forbidden access

      response '403', 'Forbidden Access' do
        schema type: :object,
          properties: {
            message: { type: :string, },

          }


      end

      #response 404

      response '404', 'Todo not found' do

      end
    end
  end

  #Method :Put
  #Path   :/todos/{id}
  #Title  :Update a todo

  path '/todos/{id}' do
    put 'Update a todo (UPDATE)' do
      tags 'Todo'
      parameter name: :id, :in => :path, :type => :string
      consumes "application/json" , "application/xml"
      parameter  in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },

        },
        required: ["title"],
      }

      #response ok

      response '204', 'Todo updated' do

      end

      #access forbidden

      response '403', 'Forbidden Access' do

      end

      #response 404

      response '404', 'Todo not found' do

      end
    end
  end

  #Method : Delete
  #Path   :/todos/
  #Title  :Delete a Todo

  path '/todos/{id}' do
    delete 'Deletes a todo ( DESTROY )' do
      tags 'Todo'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      #response ok

      response '204', 'Todo deleted' do

      end

      #access forbidden

      response '403', 'Forbidden Access' do

      end

      #response 404

      response '404', 'Todo not found' do
        
      end
    end
  end




end

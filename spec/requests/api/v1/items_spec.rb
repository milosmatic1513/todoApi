require 'swagger_helper'

RSpec.describe 'items', type: :request do


  #Method :Get
  #Path   :/todos/{id}/items
  #Title  :Retrieve all items


  path "/todos/{id}/items" do
    get 'Retrieve all items ( INDEX )' do
      tags 'Item'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            name: { type: :string, },
            done: { type: :boolean },
          },
          required: [ 'name', 'done' ]

        let(:id) { todo.create(name: 'foo', done: 'false') }
        run_test!
      end

      #access forbidden

      response '403', 'Forbidden Access' do
        schema type: :object,
          properties: {
            message: { type: :string, }
          },
          required: [ 'name', 'done' ]
        let(:todo) { { title: "foo", created_by: "bar" } }
        run_test!
      end

      response '404', 'Todo not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  #Method :Post
  #Path   :/todos/{id}/items
  #Title  :Create an item

  path "/todos/{id}/items" do
    post "Create an Item ( CREATE )" do
      tags "Item"
      consumes "application/json" , "application/xml"
      parameter name: :id, :in => :path, :type => :string
      parameter name: :item , in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          done: { type: :boolean }
        },
        required: ["name", "done","id"],
      }
      response "201", "Item created" do
        let(:item) { { name: "name", done: false} }
        run_test!
      end

      #access forbidden

      response '403', 'Forbidden Access' do
        let(:todo) { { title: "foo", created_by: "bar" } }
        run_test!
      end


      response "422", "invalid request" do
        let(:item) { { name: "name", done: false} }
        run_test!
      end
    end
  end

  #Method :Get
  #Path   :/todos/{id}/items/{id}
  #Title  :Retrieve an item

  path "/todos/{id}/items/{todo_id}" do
    get 'Retrieve an Item ( SHOW )' do
      tags 'Item'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      parameter name: :todo_id, :in => :path, :type => :string
      response '200', 'name found' do
        schema type: :object,
          properties: {
            name: { type: :string, },
            done: { type: :boolean },
          },
          required: [ 'title', 'created_by' ]

        let(:id) { todo.create(title: 'foo', created_by: 'bar') }
        run_test!
      end

      response '403', 'Forbidden Access' do
        schema type: :object,
          properties: {
            message: { type: :string, }
          },
          required: [ 'name', 'done' ]
        let(:todo) { { title: "foo", created_by: "bar" } }
        run_test!
      end

      response '404', 'Item or Todo not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  #Method :Put
  #Path   :/todos/{id}/items/{id}
  #Title  :Update an item

  path "/todos/{id}/items/{todo_id}" do
    put 'Update an Item ( UPDATE )' do
      tags 'Item'
      parameter name: :id, :in => :path, :type => :string
      parameter name: :todo_id, :in => :path, :type => :string
      consumes "application/json" , "application/xml"
      parameter  in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          done: { type: :boolean }
        },
        required: ["name", "done"],
      }

      #response ok

      response '204', 'Item updated' do
        let(:id) { todo.create(title: 'foo', created_by: 'bar') }
        run_test!
      end

      response '403', 'Forbidden Access' do
        schema type: :object,
          properties: {
            message: { type: :string, }
          },
          required: [ 'name', 'done' ]
        let(:todo) { { title: "foo", created_by: "bar" } }
        run_test!
      end

      #response 404

      response '404', 'Item / Todo not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end



  #Method : Delete
  #Path   :/todos/
  #Title  :Delete a Todo

  path '/todos/{id}/items/{todo_id}' do
    delete 'Deletes a todo ( DESTROY )' do
      tags 'Item'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      parameter name: :todo_id, :in => :path, :type => :string

      #response ok

      response '204', 'Todo deleted' do
        let(:id) { todo.create(title: 'foo', created_by: 'bar') }
        run_test!
      end
      
      response '403', 'Forbidden Access' do
        schema type: :object,
          properties: {
            message: { type: :string, }
          },
          required: [ 'name', 'done' ]
        let(:todo) { { title: "foo", created_by: "bar" } }
        run_test!
      end

      #response 404

      response '404', 'Todo not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end

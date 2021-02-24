class ItemsController < ApplicationController
  before_action :set_current_user
  before_action :set_todo
  before_action :set_todo_item ,only: [:show,:update,:destroy]

  # GET /todos/:todo_id/items
  def index
    if @current_user
      json_response(@todo.items)
    else
      json_message("Login To Add Items To Todos")
    end
  end

  #GET /todo/:todo_id/items/:id
  def show
   json_response(@item)
  end

  #POST /todo/:todo_id/items/
  def create
    json_response(@todo.items.create!(item_params),:created)
  end

  #PUT /todo/:todo_id/items/:id
  def update
    @item.update(item_params)
    head :no_content
  end

  #DELETE /todo/:todo_id/items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private
  #Functions for the Responses
  def set_todo
    @todo=@current_user.todos.find(params[:todo_id]) if @current_user
  end

  def set_todo_item
    @item = @todo.items.find_by!(id: params[:id]) if @todo
  end

  def item_params
    params.permit(:name,:done)
  end

end

class TodosController < ApplicationController
  before_action :set_current_user
  before_action :set_todo, only:[:show,:update,:destroy]

  #Get /todos
  def index
    if @current_user
      @todos = @current_user.todos.all
      json_response(@todos)
    else
      json_message("Login to View todos")
    end
  end

  #POST/todos/
  def create
    if @current_user
      @todo =@current_user.todos.create!(title: params["title"],created_by: @current_user.email)
      json_response(@todo , :created)
    else
      json_message("Login to Create todos")
    end
  end

  #GET /todos/:id
  def show
    if @current_user
      json_response(@todo)
    else
      json_message("Login to View todos")
    end
  end

  #PUT /todos/:id
  def update
    if @current_user
      @todo.update(todo_params)
      head :no_content
    else
      json_message("Login to Update todos")
    end
  end

  #DELETE /todos/:id
  def destroy
    if @current_user
      @todo.destroy
      head :no_content
    else
      json_message("Login to Delete todos")
    end
  end


  private

  def set_todo
    @todo = @current_user.todos.all.find(params[:id]) if @current_user
  end


  def todo_params
    params.permit(:title)
  end
end

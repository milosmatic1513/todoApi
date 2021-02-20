class TodosController < ApplicationController
  before_action :set_todo, only:[:show,:update,:destroy]

  #Get /todos
  def index
    @todos = Todo.all
    render json: @todos
  end
  #POST/todos/
  def create
    @todo =Todo.create!(todo_params)
    render json: @todo , status: :created
  end
  #GET /todos/:id
  def show
    render json: @todo
  end
  #DELETE /todos/:id
  def destroy
    @todo.destroy
    render status: :ok
  end
  #PUT /todos/:id
  def update
    @todo.update(todo_params)
    render status: :ok
  end
  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.permit(:title,:created_by)
  end
end

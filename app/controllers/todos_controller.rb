class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo Created Successfully"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end

  end

  def show
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = "Todo Update Successfully"
      redirect_to todo_path(@todo)
    else
      render "edit"
    end
  end

  def index
    @todo = Todo.all
  end

  def destroy
    @todo.destroy
    flash[:notice] = "Todo Deleted Successfully"
    redirect_to todos_path
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :description)
  end

end
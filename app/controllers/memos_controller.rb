class MemosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /memos
  def index
    @todos = Todo.all
    json_response(@todos)
  end

  # POST /memos
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /memos/:id
  def show
    json_response(@todo)
  end

  # PUT /memos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE /memos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end

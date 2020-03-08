# todos_controller.rb
class TodosController < ApplicationController
  def index
    render plain: Todo.all.order(:id).map{|todo| todo.looks}.join("\n")
  end
  def show
    id=params[:id]
    todo=Todo.find(id)
    render plain: todo.looks
  end
end

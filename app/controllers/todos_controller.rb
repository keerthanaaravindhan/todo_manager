# todos_controller.rb
class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render plain: Todo.all.order(:id).map{|todo| todo.looks}.join("\n")
  end
  def show
    id=params[:id]
    todo=Todo.find(id)
    render plain: todo.looks
  end
  def create
    todo_txt=params[:todo_text]
    due_date=DateTime.parse(params[:due_date])
    new_todo=Todo.create!(todo_text:todo_txt,due_date:due_date,completed:false)
    render plain: "New todo is created at id #{new_todo.id}"
  end 
end

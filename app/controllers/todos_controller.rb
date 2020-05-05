# todos_controller.rb
class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.all.order(:id).map{|todo| todo.looks}.join("\n")
    #@todos = Todo.of_user(current_user)
    @todos = current_user.todos
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    render "todo"
    #render plain: todo.looks
  end

  def create
    todo_txt = params[:todo_text]
    due_date = params[:due_date]
    new_todo = Todo.new(
      todo_text: todo_txt,
      due_date: due_date, 
      completed: false, 
      user_id: current_user.id
    )
    if new_todo.save
      redirect_to todos_path
    else 
    # render plain: "New todo is created at id #{new_todo.id}"
      flash[:error] = new_todo.errors.full_messages.join(", ")
      redirect_to todos_path
    end
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.of_user(current_user).find(id)
    todo.completed = completed
    todo.save!
    #render plain: todo.looks
    redirect_to todos_path
  end

  def destroy
    id= params[:id]
    todo=Todo.of_user(current_user).find(id)
    todo.destroy
    redirect_to todos_path
  end
end

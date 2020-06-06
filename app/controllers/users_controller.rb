class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def index
    render plain: User.all.order(:id).map { |user| user.looks }.join("\n")
  end

  # this create is used when sent param explicitely
  #def create
   # name = params[:name]
   # email = params[:email]
   # pwd = params[:password]
   # new_user = User.create!(name: name, email: email, password: pwd)
   # render plain: "New todo is created at id #{new_user.id}"
  #end

  # this create is used when sign up is used
  #def create
  # User.create!(
   # first_name: params[:first_name],
   # last_name: params[:last_name],
   #   email: params[:email],
   #   password: params[:password],
   # )
   # redirect_to "/"
  #end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    if new_user.save
     flash[:error] = "User Registered. Sign-in to continue"
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
  
  def login
    email = params[:email]
    pwd = params[:password]
    if User.exists?(email: email, password: pwd)
      render plain: "True"
    else
      render plain: "False"
    end
  end
end

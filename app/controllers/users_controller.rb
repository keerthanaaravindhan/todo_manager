class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.order(:id).map { |user| user.looks }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    pwd = params[:password]
    new_user = User.create!(name: name, email: email, password: pwd)
    render plain: "New todo is created at id #{new_user.id}"
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

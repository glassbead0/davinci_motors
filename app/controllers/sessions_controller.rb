class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # user submitted valid password
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back #{user.first_name}"
    else
      flash[:error] = "Oops, something went wrong. Try again."
      render :login
    end
  end

  def destroy
    user = current_user
    session[:user_id] = nil
    redirect_to root_path,
      notice: "See you next time #{user.email}"
  end

  def oauth
    @user = User.where(email: omniauth_options[:email]).first_or_initialize(omniauth_options)
    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome back #{@user.first_name}"
    else
      render 'users/new'
    end
  end

  private

  def omniauth_options
    if auth_hash = request.env['omniauth.auth']
      first_name, last_name = auth_hash[:info][:name].split(/\s+/, 2)
      {
        email: auth_hash[:info][:email],
        first_name: first_name,
        last_name: last_name,
        omniauth: true
      }
    end
  end
end


class CylController < ApplicationController
  layout 'simplex'

  def index
  end

  def entrar
    render :action => 'entrar', :layout => 'login'
  end

  def login
    u = User.find_by_email(params[:email])
    if u.nil?
      flash[:error] = 'ese email no está registrado'
      render :action => 'entrar'
    elsif u.pass == params[:pass]
      session[:user] = u.id
      session[:user_name] = u.name
      render :action => 'index'
    else
      flash[:error] = 'la contraseña no es correcta'
      render :action => 'entrar'
    end
  end
end
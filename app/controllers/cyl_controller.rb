
class CylController < ApplicationController
  layout 'simplex'

  def index
  end

  def entrar
    render_login
  end

  def login
    session[:user_id] = nil
    u = User.find_by_email(params[:email])
    if u.nil?
      render_login 'Ese email no está registrado'
    elsif u.pass == ""
      session[:user_id] = u.id
      redirect_to :action => 'change_password'
    elsif u.pass != params[:pass]
      render_login 'La contraseña no es correcta'
    else
      session[:user_id] = u.id
      redirect_to :controller => 'users'
    end
  end

  def new_password
  end

  def change_password
    if params[:pass].length < 6
      flash[:error] = 'Pon algo más largo de 5 caracteres, ánda...'
      render :action => 'new_password'
    elsif params[:pass] != params[:pass2]
      flash[:error] = 'Las contraseñas no son iguales!'
      render :action => 'new_password'
    else
      @current.passs = params[:pass]
      @current.save
      redirect_to :controller => 'users'
    end
  end

  def blog_new
  end

  def blog_create
    Document.transaction do
      d = Document.create(params[:blog])
      Clip.create(:title => 'Entrada al blog', :description => d.summary, :content_class => 'Document',
        :content_type => 'blog', :recipient_id => 1, :user_id => @current.id, :content_id => d.id )
      redirect_to :action => 'blog'
    end
  end

  private
  def render_login(error = nil)
    flash[:error] = error
    render :action => 'entrar', :layout => 'login'
  end
end
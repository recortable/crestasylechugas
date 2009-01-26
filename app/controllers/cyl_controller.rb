
class CylController < ApplicationController
  layout 'simplex'

  def index
    render :action => 'crestas', :layout => 'portal'
  end

  def crestas
    render :action => 'crestas', :layout => 'portal'
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
      session[:color] = params[:user][:color]
      redirect_to :action => 'change_password'
    elsif u.pass != params[:pass]
      render_login 'La contraseña no es correcta'
    else
      session[:user_id] = u.id
      session[:color] = params[:user][:color]
      redirect_to :action => 'dashboard'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'crestas'
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

  def calendar
    today = Date.today
    params[:month] ||= today.month
    params[:year] ||= today.year
    @cal = {:month => params[:month].to_i,  :year => params[:year].to_i}
  end

  def event_new
    @date = Date.from_db(params[:date])
  end

  def clip_create
    clip = Clip.build(@current, params[:clip], params[:document])
    flash[:notice] = clip.description
    redirect_to clip
  end

  def message_create
    Document.transaction do
      d = Document.create(params[:message])
      d.new_clip('Mensaje', 'message', @current, params[:clip][:recipient]).save
      redirect_to :action => 'message'
    end
  end

  def event_create
    fecha = Date.from_db(params[:clip][:date]).fecha
    Document.transaction do
      d = Document.create(params[:event])
      d.new_clip("Evento el #{fecha}", 'event', @current, params[:clip][:recipient], params[:clip][:date]).save
      redirect_to :action => 'calendar'
    end
  end

  def blog_create
    Document.transaction do
      d = Document.create(params[:blog])
      d.new_clip('Entrada al blog', 'blog', @current, 1).save
      redirect_to :action => 'blog'
    end
  end

  def response_create
    clip = Clip.find(params[:id])
    clip.document.response(params[:clip][:response]).save
    flash[:notice] = 'Respuesta creada'
  end



  def update_tags
    clip = Clip.find(params[:id])
    clip.tag_list = params[:clip][:tags]
    clip.save
    redirect_to clip
  end

  private
  def render_login(error = nil)
    flash[:error] = error
    render :action => 'entrar'
  end
end
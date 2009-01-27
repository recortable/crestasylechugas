
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
      Clip.create(params[:clip].merge(:user_id => @current.id, :content_id => d.id, :content_class => 'Document',
          :title => "Nuevo mensaje", :description => d.summary))
      redirect_to_dashboard
    end
  end


  def upload_create
    Document.transaction do
      d = Document.create(params[:document])
      Clip.create params[:clip].merge(:user_id => @current.id, :content_id => d.id, :content_class => 'Document',
        :title => 'Nuevo fichero', :description => d.body)
      redirect_to_dashboard
    end
  end

  def event_create
    fecha = Date.from_db(params[:clip][:date]).fecha
    Document.transaction do
      d = Document.create(params[:event])
      Clip.create(params[:clip].merge(:user_id => @current.id, :content_id => d.id, :content_class => 'Document',
          :title => "Evento el #{fecha}", :description => d.title))
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
    d = Document.create(params[:response])
    Clip.create params[:clip].merge(:user_id => @current.id, :content_id => clip.content_id, :content_class => 'Document',
      :title => "Respuesta a #{clip.title}", :description => d.summary,
      :group_id => clip.group_id, :recipient_id => clip.recipient_id)
    flash[:notice] = 'Respuesta creada'
    redirect_to_dashboard
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

  def redirect_to_dashboard
    redirect_to :action => 'dashboard'
  end
end
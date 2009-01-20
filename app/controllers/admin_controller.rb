class AdminController < ApplicationController
  layout 'simplex'
  before_filter :check_admin

  def index
  end

  def create_group
    Group.transaction do
      g = Group.create(params[:group])
      g.new_clip(@current).save
      show_admin 'Grupo creado con éxito'
    end
  end

  def create_member
    User.transaction do
      m = User.new(params[:user])
      m.groups  << Group.find(1)
      m.save
      Clip.create(:title => 'Nuevo miembro!', :description => "Damos la bienvenida a #{m.name}",
        :content_class => 'User', :content_type => 'user', :content_id => m.id, :user_id => @current.id)
      show_admin 'Se ha añadido un nuevo miembro! lol lol'
    end
  end

  def create_label
    Label.transaction do
      l = Label.create(params[:label])
      Clip.create(:title => 'Nueva etiqueta', :description => "#{l.description}",
        :content_class => 'Tag', :content_type => 'tag', :content_id => l.id, :user_id => @current.id)
      show_admin "Se ha añadido la etiqueta '#{l.name}'"
    end
  end

  private
  def check_admin
    redirect_to :root if @current.nil? || !@current.admin?
  end

  def show_admin(message)
    flash[:notice] = message
    redirect_to :action => 'index'
  end
end

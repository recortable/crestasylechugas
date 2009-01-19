class AdminController < ApplicationController
  layout 'simplex'
  before_filter :check_admin

  def index
  end

  def create_group
    Group.transaction do
      g = Group.create(params[:group])
      Clip.create(:title => 'Nuevo grupo', :description => "Damos la bienvenida al grupo #{g.name}",
        :content_class => 'Group', :content_type => 'group', :content_id => g.id, :user_id => @current.id)
    end
    show_admin 'Grupo creado con éxito'
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

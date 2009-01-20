# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include HoptoadNotifier::Catcher
  helper :all # include all helpers, all the time
  before_filter :load_user, :except => [:entrar, :login]
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '31d03b77f168a275d41b7d10b31f4421'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  def load_user
    puts "LOAD USER #{session[:user_id]}"
    if session[:user_id].nil?
      redirect_to :controller => "cyl", :action => "entrar"
    elsif
      @current = User.find(session[:user_id])
      render :controller => 'cyl', :action => 'new_password' if @current.pass == ''
    end
  end
end

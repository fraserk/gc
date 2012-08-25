class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_404
  if /(jpe?g|png|gif)/i === request.path
    render :text => "404 Not Found", :status => 410 # Change the status here
  else
    render :file => "#{Rails.root}/public/404.html", :layout => 'application', :status => 410 #and here
  end
end

end

class Cpanel::HomeController < CpanelController

  def index
    redirect_to cpanel_posts_path
  end

end
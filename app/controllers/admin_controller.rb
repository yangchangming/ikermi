class AdminController < ApplicationController
    layout "application"
    #before_filter :is_logged_in?,:only=>[:panel]
    
    def index
    end

end

class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def about
    @title = "About"
  end

  def demo
    @title = "Demo"
  end

  def contact
    @title = "Contact"
  end
  
  def help
    @title = "Help"
  end
  
  def user
    @title = "Users"
  end
  
  def job
    @title = "Jobs"
  end
  
  def news
    @title = "News"
  end


end

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

end

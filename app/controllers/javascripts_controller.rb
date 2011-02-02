class JavascriptsController < ApplicationController
  def dynamic_programs
    @options = Option.all
  end

end

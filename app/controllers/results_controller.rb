class ResultsController < ApplicationController
  def show
    @result = Result.find(params[:id])
  end

end

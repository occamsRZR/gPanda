class ResultsController < ApplicationController
  def show
    @result = Result.find(params[:id])
    @server = Bio::Fetch.new
  end

end

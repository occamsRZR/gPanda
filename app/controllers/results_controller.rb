class ResultsController < ApplicationController
  def show
    @result = Result.find(params[:id])
    ### ALL OF THIS SHOULD BE TEMP
    ### TESTS NEED TO BE WRITTEN
    server = Bio::Fetch.new
    @gb_obj = Bio::GenBank.new(server.fetch('genbank', @result.gi))
    @gi = @gb_obj.gi.sub(/GI\:/, '')
    ### DELETE THESE AFTER THE DEMO
    ### TESTS NEED TO BE WRITTEN
  end

end

class GithubimgController < ApplicationController

  def index
    @username = params[:name]
    if @username == nil
      @username = 'jessicabao'
    end
    svg = GithubChart.new(@username).svg
    @img = svg
    respond_to do |format|
      format.svg { render inline: @img}
    end

  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    # def github_params
    #   params.require(:github).permit(:name)
    # end

end

class GithubController < ApplicationController

  def index
    @username = params[:name]
    if @username == nil
      @username = 'jessicabao'
    end
    stats = GithubStats.new(@username)
    @github = stats
    render json: stats.data, :callback => params['callback']
  end

  # def show
  #   stats = GithubStats.new(github_params)
  #   @github = stats
  #   render json: stats.data
  # end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    # def github_params
    #   params.require(:github).permit(:name)
    # end

end

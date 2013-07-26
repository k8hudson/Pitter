class PatsController < ApplicationController

  before_action :check_user_login
  def index
    @pats = Pat.all
  end

  def show
    @pat = Pat.find(params[:id])
  end

  def new
    @pat = Pat.new
  end

  def create
    @pat = Pat.create(tweet_params)
    @pat.user = User.first
    @pat.save
    redirect_to pats_path
    #no view, redirects to index

  end

  def destroy
  end

  private #not a url

  def pat_params
    params.require(:pat).permit(:content) 
    #does not allow anything other than content, helps prevent malicious data
  end

  def check_user_login
    @current_user = User.find(session[:user_id])
  end
end

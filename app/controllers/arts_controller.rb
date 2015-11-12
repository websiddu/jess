class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show, :vote]
  protect_from_forgery with: :null_session

  # GET /arts
  # GET /arts.json
  def index
    @arts = Art.all
    if params[:rand]
      @arts = (0..Art.count-1).sort_by{rand}.slice(0, params[:rand].to_i).collect! do |i| Art.skip(i).first end
    end
  end

  # GET /arts/1
  # GET /arts/1.json
  def show
    @art = Art.find(params[:id])
    @art.inc(views: 1)
  end

  # GET /arts/new
  def new
    @art = Art.new
  end

  # GET /arts/1/edit
  def edit
  end

  # POST /arts
  # POST /arts.json
  def create
    @art = Art.new(art_params)

    respond_to do |format|

      if art_params[:preview].present?
        colors = Cloudinary::Uploader.upload(art_params[:preview], :colors => true)
        @art.colors = colors['colors']
      end

      if @art.save
        format.html { redirect_to @art, notice: 'Art was successfully created.' }
        format.json { render action: 'show', status: :created, location: @art }
      else
        format.html { render action: 'new' }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arts/1
  # PATCH/PUT /arts/1.json
  def update
    respond_to do |format|

      if art_params[:preview].present?
        colors = Cloudinary::Uploader.upload(art_params[:preview], :colors => true)
        art_params['colors'] = colors['colors']
        @art.colors = colors['colors']
      end

      if @art.update(art_params)
        format.html { redirect_to @art, notice: 'Art was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  def vote
    respond_to do |format|
      @art = Art.find(params[:id])
      votes = @art.votes + 1
      if @art.update(:votes => votes)
        format.json { render json: votes, status: :ok }
      end
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.json
  def destroy
    @art.destroy
    respond_to do |format|
      format.html { redirect_to arts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art
      @art = Art.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def art_params
      params.require(:art).permit(:name, :date, :content, :preview, :preview_thumb, :source, :views, :votes, :sequence, :tags, :colors, :attachment)
    end
end

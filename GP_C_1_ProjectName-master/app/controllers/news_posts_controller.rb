class NewsPostsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
    @news_posts = NewsPost.all
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news_posts = NewsPost.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news_posts = NewsPost.new(news_params)

    respond_to do |format|
      if @news_posts.save
        format.html { redirect_to @news_posts, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @news_posts }
      else
        format.html { render :new }
        format.json { render json: @news_posts.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news_posts.update(news_params)
        format.html { redirect_to @news_posts, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_posts }
      else
        format.html { render :edit }
        format.json { render json: @news_posts.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news_posts.destroy
    respond_to do |format|
      format.html { redirect_to '/news_posts', notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news_posts = NewsPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news_post).permit(:title, :body)
    end
end

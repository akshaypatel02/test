class BlogArticalsController < ApplicationController
  before_action :set_blog_artical, only: [:show, :edit, :update, :destroy]

  # GET /blog_articals
  # GET /blog_articals.json
  def index
    @blog_articals = BlogArtical.all
  end

  def feed
    @blog_articles = BlogArticle.all
    respond_to do |format|
    format.rss { render layout: false }
end
  end

  # GET /blog_articals/1
  # GET /blog_articals/1.json
  def show
  end

  # GET /blog_articals/new
  def new
    @blog_artical = BlogArtical.new
  end

  # GET /blog_articals/1/edit
  def edit
  end

  # POST /blog_articals
  # POST /blog_articals.json
  def create
  @blog_article = BlogArticle.new(blog_article_params)

  respond_to do |format|
    if @blog_article.save

      # add this code
      uri = URI.parse 'http://finalproject.herokuapp.com/'
      post_params = {
        'hub.mode' => 'publish',
        'hub.url' => 'http://finalproject.herokuapp.com/feed.rss',
      }
      Net::HTTP.post_form uri, post_params
      ###########

      format.html { redirect_to @blog_article, notice: 'Blog article was successfully created.' }
      format.json { render :show, status: :created, location: @blog_article }
    else
      format.html { render :new }
      format.json { render json: @blog_article.errors, status: :unprocessable_entity }
    end
  end
end

  # PATCH/PUT /blog_articals/1
  # PATCH/PUT /blog_articals/1.json
  def update
    respond_to do |format|
      if @blog_artical.update(blog_artical_params)
        format.html { redirect_to @blog_artical, notice: 'Blog artical was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_artical }
      else
        format.html { render :edit }
        format.json { render json: @blog_artical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_articals/1
  # DELETE /blog_articals/1.json
  def destroy
    @blog_artical.destroy
    respond_to do |format|
      format.html { redirect_to blog_articals_url, notice: 'Blog artical was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_artical
      @blog_artical = BlogArtical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_artical_params
      params.require(:blog_artical).permit(:title, :author, :text)
    end
end

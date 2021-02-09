class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_article, except: %i[index new create]
  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/:id
  def show
    @article.update_visits_count
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles
  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # GET /articles/:id/edit
  def edit; end

  # PUT /articles/:id

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # DELETE /articles/:id
  # Destroy elimina el objeto de la base de datos
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end

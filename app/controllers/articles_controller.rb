class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "bill", password: "password", except: [:index, :show]

  def index
    # @articles = Article.all
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article created successfully.'
      redirect_to @article
    else
      flash[:alert] = 'Failed to create article.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    # @article.destroy
    @article.comments.destroy_all
    if @article.destroy
      redirect_to root_path, notice: 'Article was successfully deleted.'
    else
      redirect_to root_path, alert: 'Failed to delete article.'
    end
    # redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end

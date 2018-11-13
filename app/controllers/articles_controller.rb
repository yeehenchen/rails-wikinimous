class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(validate_params)
    @article.save
    redirect_to article_path(@article.id), alert: "Article was successfully created."
  end

  def edit
  end

  def update
    @article.update(validate_params)
    redirect_to article_path(@article.id), alert: "Article was successfully updated."
  end

  def destroy
    @article.destroy
    redirect_to articles_path, alert: "Article was successfully destroyed."
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def validate_params
    params.require(:article).permit(:title, :content)
  end
end

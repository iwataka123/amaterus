class ArticlesController < ApplicationController

  before_action :log_in_check
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.all.order("created_at DESC")
    @schedules = current_user.schedules.includes(:user)
    @today_schedule = current_user.schedules.where("DATE(start_time) = ?", Date.today)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      return redirect_to root_path
    else
      render new_article_path
    end
  end

  def edit
  end
  
  def update
    if @article.update(article_params)
      return redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      return redirect_to root_path
    else
      render 'show'
    end
  end

  private
  def log_in_check
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def article_params
    params.require(:article).permit(:title, :poster, :content, :image).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
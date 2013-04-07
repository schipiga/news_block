class NewsController < ApplicationController
  before_filter :authenticate_user!, except: :index

  NEWS_PER_PAGE = 10

  def new
    @newska = News.new
    render layout: false
  end

  def create
    current_user.news.create! params[:news]
    render nothing: true
  end

  def vote
    value = params[:type] == 'up' ? 1 : -1
    @newska = News.find params[:id]
    @newska.add_or_update_evaluation :votes,
                                     value,
                                     current_user
    render partial: 'newska', locals: { newska: @newska }
  end

  def index
    @news = News.paginate page: params[:page],
                          per_page: NEWS_PER_PAGE
    render layout: false
  end
end

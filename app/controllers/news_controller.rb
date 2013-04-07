class NewsController < ApplicationController

  NEWS_PER_PAGE = 10

  def new
    @newska = News.new
    render layout: false
  end

  def create
    current_user.news.create! params[:news]
    render nothing: true
  end

  def index
    @news = News.paginate page: params[:page],
                          per_page: NEWS_PER_PAGE
    render layout: false
  end
end

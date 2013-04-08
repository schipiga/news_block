class NewsController < ApplicationController
  before_filter :authenticate_user!, except: [:index,
                                              :by_votes,
                                              :show]

  layout false

  NEWS_PER_PAGE = 10

  def new
    @newska = News.new
  end

  def edit
    newska
  end

  def create
    current_user.news.create! params[:news]
    render nothing: true
  end

  def update
    newska.update_attributes params[:news]
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
    @news = News.by_date.paginate page: params[:page],
                          per_page: NEWS_PER_PAGE
  end

  def by_votes
    @news = News.find_with_reputation(:votes,
                                      :all,
                                      order: 'votes DESC')
                .paginate page: params[:page],
                          per_page: NEWS_PER_PAGE
    render 'index'
  end

  def my
    @news = current_user.news.paginate page: params[:page],
                                       per_page: NEWS_PER_PAGE
    render 'index'
  end

  def show
    @newska = News.find params[:id]
  end

  def delete
    newska.destroy
    render nothing: true
  end

  protected

  def newska
    @newska ||= current_user.news.find params[:id]
  end
end

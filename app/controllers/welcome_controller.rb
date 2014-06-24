class WelcomeController < ApplicationController
  def index
    @latest_articles = Article.latest
  end
end

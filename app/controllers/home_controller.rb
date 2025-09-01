class HomeController < ApplicationController
  def index
    @greeting = GreetingService.current
    @wisdom = WisdomService.current
    @applications = Application.all.order(:position)
    @categories = Category.all.includes(:bookmarks).order(:position)
  end
end

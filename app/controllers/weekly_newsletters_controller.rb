class WeeklyNewslettersController < ApplicationController
  def index
    @newsletters = WeeklyNewsletter.order(published_at: :desc)
  end

  def show
    @newsletter = WeeklyNewsletter.find(params[:id])
  end
end

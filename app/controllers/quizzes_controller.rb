class QuizzesController < ApplicationController

  def show
    @quiz = Deck.find params[:id]
  end
end

class WelcomeController < ApplicationController
  def show
    p "*" * 60
    p params
    p "*" * 60
  end
end

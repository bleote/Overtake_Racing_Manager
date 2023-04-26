class CircuitsController < ApplicationController
  # List of all the circuits
  def index
    @circuits = Circuit.all
  end
end

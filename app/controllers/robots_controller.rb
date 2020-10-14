class RobotsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  include ToyRobot

  def index
  end

  def create
    commands = params[:cmd]

    logger.info "received #{commands.class} params are #{commands}"

    robot = ToyRobot::Rover.new(commands.split("|"))
    robot.go!

    render json: { steps: robot.show_the_path }
  end
end

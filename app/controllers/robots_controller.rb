class RobotsController < ApplicationController
  include ToyRobot
  skip_before_action :verify_authenticity_token, only: ['create']

  def create
    commands = params[:commands]

    logger.info "received #{commands.class} params are #{commands}"

    robot = ToyRobot::Rover.new(commands.split("|"))
    robot.go!
    response = robot.show_the_path
    arr = ''
    arr1 = ''
    arr2 = ''
    response.each do |key, value|
      i = 0
      j = 0
      k = 0
      key.each do |val|
        if i == 0
          arr =  val[1]
        end
        i = i + 1
      end
      key.each do |val|
        if j == 1
          arr1 =  val[1]
        end
        j = j + 1
      end
      key.each do |val|
        if k == 2
          arr2 =  val[1]
        end
        k = k + 1
      end
    end
    render json: { location: [arr, arr1, arr2] }
  end
end


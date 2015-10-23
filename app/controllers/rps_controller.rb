class RpsController < ApplicationController
  def init
    @nav_r = "btn-primary"
    @nav_p = "btn-primary"
    @nav_s = "btn-primary"
    @r     = "btn-primary"
  end
  def result_color(res)
    if res == "You Tied!" then @r="btn-warning" end
    if res == "You Won!"  then @r="btn-success" end
    if res == "You Lost!" then @r="btn-danger" end
  end
  def button_color(player)
    if player == "ROCK"     then @nav_r = "btn-warning" end
    if player == "PAPER"    then @nav_p = "btn-warning" end
    if player == "SCISSORS" then @nav_s = "btn-warning" end
  end
  def game(p_move,c_move)
    case
    when p_move == c_move
        @result = "You Tied!"
    #    Human rock / Computer paper
    when p_move == "ROCK" && c_move == "PAPER"
        @result = "You Lost!"
    #    Human rock / Computer scissors
    when p_move == "ROCK" && c_move == "SCISSORS"
        @result = "You Won!"
    #    Human paper / Computer rock
    when p_move == "PAPER" && c_move == "ROCK"
        @result = "You Won!"
    #    Human paper / Computer scissors
    when p_move == "PAPER" && c_move == "SCISSORS"
        @result = "You Lost!"
    #    Human scissors / Computer rock
    when p_move == "SCISSORS" && c_move == "ROCK"
        @result = "You Lost!"
    #    Human scissors / Computer paper
    when p_move == "SCISSORS" && c_move == "PAPER"
        @result = "You Won!"
    end
    #flags for dynamic tags. God knows if that I am supposed to hijack html like that...
    init() #initiates dynamic variables
    result_color(@result) #adjust button color for results
    button_color(@player) #adjust button color for results
    return @result
  end
  def rock
    @player   = "ROCK"
    @computer = ["ROCK","PAPER","SCISSORS"].sample
    @results  = game(@player,@computer)
    render("rps.html.erb")
  end
    def paper
    @player   = "PAPER"
    @computer = ["ROCK","PAPER","SCISSORS"].sample
    @results  = game(@player,@computer)
    render("rps.html.erb")
  end
    def scissors
    @player   = "SCISSORS"
    @computer = ["ROCK","PAPER","SCISSORS"].sample
    @results  = game(@player,@computer)
    render("rps.html.erb")
  end
end

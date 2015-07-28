class GameController < ApplicationController
  # This action is for the bare domain. You can ignore it.
  def home
    redirect_to("/mockup.html")
  end

  # Your code goes below.

  def play

    @all_moves = Move.all
    @summary_stats = Summary.all

    # Rails, behind the scenes:
    # params = {"move"=>"rock"}

    @user_move = params["the_move"]

    @computer_move = ["rock", "paper", "scissors"].sample

    if @user_move == @computer_move
      @outcome = "tie"
    elsif @user_move == "paper" && @computer_move == "rock"
      @outcome = "won"
    elsif @user_move == "paper" && @computer_move == "scissors"
      @outcome = "lost"
    elsif @user_move == "scissors" && @computer_move == "rock"
      @outcome = "lost"
    elsif @user_move == "scissors" && @computer_move == "paper"
      @outcome = "won"
    elsif @user_move == "rock" && @computer_move == "paper"
      @outcome = "lost"
    elsif @user_move == "rock" && @computer_move == "scissors"
      @outcome = "won"
    end

    m = Move.new
    m.user_move = @user_move.to_s
    m.computer_move = @computer_move.to_s
    if @outcome == "won"
      m.user_wins = 1
      m.computer_wins = 0
      m.tie = 0
    elsif @outcome == "lost"
      m.user_wins = 0
      m.computer_wins = 1
      m.tie = 0
    elsif @outcome == "tie"
      m.user_wins = 0
      m.computer_wins = 0
      m.tie = 1
    end
    m.save

    s = Summary.new
    if @user_move == "rock" && @outcome == "won"
      s.rock_won = 1
      s.rock_lost = 0
      s.rock_tied = 0
    elsif @user_move == "rock" && @outcome == "lost"
      s.rock_won = 0
      s.rock_lost = 1
      s.rock_tied = 0
    elsif @user_move == "rock" && @outcome == "tie"
      s.rock_won = 0
      s.rock_lost = 0
      s.rock_tied = 1
    elsif @user_move == "paper" && @outcome == "won"
      s.paper_won = 1
      s.paper_lost = 0
      s.paper_tied = 0
    elsif @user_move == "paper" && @outcome == "lost"
      s.paper_won = 0
      s.paper_lost = 1
      s.paper_tied = 0
    elsif @user_move == "paper" && @outcome == "tie"
      s.paper_won = 0
      s.paper_lost = 0
      s.paper_tied = 1
    elsif @user_move == "scissors" && @outcome == "won"
      s.scissors_won = 1
      s.scissors_lost = 0
      s.scissors_tied = 0
    elsif @user_move == "scissors" && @outcome == "lost"
      s.scissors_won = 0
      s.scissors_lost = 1
      s.scissors_tied = 0
    elsif @user_move == "scissors" && @outcome == "tie"
      s.scissors_won = 0
      s.scissors_lost = 0
      s.scissors_tied = 1
    end
    s.save


    render("play.html.erb")
  end
end

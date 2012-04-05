class UserGamesController < ApplicationController
  # GET /user_games
  # GET /user_games.json
  def index
    @user_games = UserGame.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_games }
    end
  end

  # GET /user_games/1
  # GET /user_games/1.json
  def show
    @user_game = UserGame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_game }
    end
  end

  # GET /user_games/new
  # GET /user_games/new.json
  def new
    @user_game = UserGame.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_game }
    end
  end

  # GET /user_games/1/edit
  def edit
    @user_game = UserGame.find(params[:id])
  end

  # POST /user_games
  # POST /user_games.json
  def create
    @user_game = UserGame.new(params[:user_game])

    respond_to do |format|
      if @user_game.save
        format.html { redirect_to @user_game, notice: 'User game was successfully created.' }
        format.json { render json: @user_game, status: :created, location: @user_game }
      else
        format.html { render action: "new" }
        format.json { render json: @user_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_games/1
  # PUT /user_games/1.json
  def update
    @user_game = UserGame.find(params[:id])

    respond_to do |format|
      if @user_game.update_attributes(params[:user_game])
        format.html { redirect_to @user_game, notice: 'User game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_games/1
  # DELETE /user_games/1.json
  def destroy
    @user_game = UserGame.find(params[:id])
    @user_game.destroy

    respond_to do |format|
      format.html { redirect_to user_games_url }
      format.json { head :no_content }
    end
  end
end

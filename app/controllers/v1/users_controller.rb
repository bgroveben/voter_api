module V1
  class UsersController < ApplicationController
    # GET /users
    # GET /users.json
    def index
      @users = User.all

      render json: @users
    end

    # GET /users/1
    # GET /users/1.json
    def show
      @user = User.find_by_token(params[:id]) || User.find(params[:id])

      render json: @user
      # render json: @user, only: [:id, :token]
      # render json: User.find(params[:id]), only: [:id]
      # render json: @user.id
    end

    # POST /users
    # POST /users.json
    def create

      @user = User.new(user_params)

      if @user.save
        render json: {token: @user.token}, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update

      @user = User.find(params[:id])

      if @user.update(params[:user])
        head :no_content
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def candidates
      # candidate = Candidate.find(params[:id])
      head :ok
    end

    def clients
      # client = Client.find(params[:id])
      head :ok
    end

    def elections
      # election = Election.find(params[:id])
      head :ok
    end

    def issues
      # issue = Issue.find(params[:id])
      head :ok
    end

    #  def token
    #    @user = User.find_by_token(params[:id])

    #    render json: @user
    #  end

    # DELETE /users/1
    # DELETE /users/1.json
    # def destroy
    #  @user = User.find(params[:id])
    #  @user.destroy

    #  head :no_content
    # end

    #Require strong_params/replace attr_accessible
    private
      def user_params
        params.require(:user).permit(:address1, :address2, :city, :state, :zipcode)
      end
  end
end

class SportsController < ApplicationController
    
    def index
        p current_user
        @sports = current_user.sports
        
    end
    
    def show
        @sport = Sport.where(user_id: current_user.id).find(params[:id])
    end
    
    def new
        @sport = Sport.new
    end
    
    def create
        sport_params = params.require(:sport).permit(:year, :month, :name1, :name2, :result)
        sport_params[:user_id] = current_user.id
        @sport = Sport.new(sport_params)
        if @sport.save
            flash[:notice] = "データを1件登録しました"
            redirect_to sports_path
        else
            flash.now[:alert] = "登録に失敗しました"
            render :new
        end
    end
    
    def edit
        @sport = Sport.where(user_id: current_user.id).find(params[:id])
    end
    
    def update
        @sport = Sport.find(params[:id])
        sport_params = params.require(:sport).permit(:year, :month, :name1, :name2, :result)
        if @sport.update(sport_params)
            flash[:notice] = "データを1件更新しました"
            redirect_to sports_path
        else
            flash.now[:alert] = "更新に失敗しました。"
            render :edit
        end
    end
    
    def destroy
        @sport = current_user.sports
        @sport.destroy
        flash[:notice] = "削除しました"
        redirect_to sports_path
    end
    
end
class SportsController < ApplicationController
    
    def index
        p current_user
        @sports = Sport.all
        @sports = @sports.where(year: params[:year]) if params[:year].present?
        @sports = @sports.where(month: params[:month]) if params[:month].present?
        @sports = @sports.where(name1: params[:name1]) if params[:name1].present?
        @sports = @sports.where(name2: params[:name2]) if params[:name2].present?
    end
    
    def show
        @sport = Sport.find(params[:id])
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
            flash.now[:alert] = "登録に失敗しました。"
            render :new
        end
    end
    
    def edit
        @sport = Sport.find(params[:id])
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
        @sport = Sport.find(params[:id])
        @sport.destroy
        flash[:notice] = "削除しました"
        redirect_to sports_path
    end
    
end
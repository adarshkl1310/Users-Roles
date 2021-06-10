class HomesController < ApplicationController

before_action :find_home, only: [:show, :edit, :update, :destroy]

def index


@homes = Home.order('created_at DESC')
end

def new
@home = Home.new  
end

def create
@home = Home.new(home_params)
@home.user_id = current_user.id
  if @home.save
    redirect_to homes_path
else
  render "new"
end
end


def show

    @home = Home.where(params[:id])	
  	@user = User.find(params[:id].to_i)
 
	
end	


def destroy
@home = Home.find(params[:id])
  @home.destroy
  redirect_to home_path(@home.user.id)
	
end




private

def home_params
    

   params.require(:home).permit(:image,:photo_name)
    
    end


def find_home

  
      @home = Home.where(params[:id])
end
end

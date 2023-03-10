class CatsController < ApplicationController
    before_action :logged?, only: [:edit, :update, :new, :create]
    before_action :set_current_user, only: [:edit, :update]
    before_action :check_owner, only: [:edit, :update]
    
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.includes(rental_requests: :requester).find(params[:id])
        render :show
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create
        @cat = Cat.new(cat_params)
        @cat.user_id = current_user.id
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render :new
        end
    end

    def edit
        @cat = current_user.cats.find(params[:id])
        render :edit
    end

    def update
        @cat = current_user.cats.find(params[:id])
        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render :edit
        end
    end

    private
    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end

end
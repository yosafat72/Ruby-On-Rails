class UserController < ApplicationController

    skip_before_action :verify_authenticity_token, raise: false
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordNotUnique, with: :not_unique

    @response = nil


    def initialize
        @response = ResponseHandler::Response.new
    end

    def index()
        @user = User.all
        render json: @response.ResponseJson(@user, "Success!").to_json, status: 200
    end

    def show()
        @user = User.where(["id_user = ?", params[:id]]).first
        if @user.present?
            render json: @response.ResponseJson(@user, "Success!").to_json, status: 200
        else
            render json: @response.ResponseJson("", "We can't found any data!").to_json, status: 400
        end
    end

    def create()
        @user = User.new(user_params)

        if @user.save!
            render json: @response.ResponseJson("", "Success!").to_json, status: 200
        else
            render json: @response.ResponseJson("", "Failed!").to_json, status: 400
        end
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            render json: @response.ResponseJson("", "Success!").to_json, status: 200
        else 
            render json: @response.ResponseJson("", "Failed!").to_json, status: 400
        end
    end

    def destroy
        @user = User.find(params[:id])

        if @user.destroy
            render json: @response.ResponseJson("", "Success!").to_json, status: 200
        else 
            render json: @response.ResponseJson("", "Failed!").to_json, status: 400
        end
    end

    private
    def user_params
        params.permit(:nm_user, :dob_user, :gender_user, :phone_user, :email_user, :desc_user, :id_user, )
    end

    def not_found
        render json: @response.ResponseJson("", "Data not found!").to_json, status: 400
    end

    def not_unique
        render json: @response.ResponseJson("", "Errorr!").to_json, status: 400
    end
end

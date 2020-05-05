class UsersController < ApplicationController
    before_action :logged_in?, :current_user, :set_userable, except: [:new, :create]

    def new
    end

    def create
        if params[:landlord] == "0"
            @tenant = Tenant.new(userable_params)
            if @tenant.valid?
                @tenant.save
                @user = @tenant.build_user(user_params)
                if @user.valid?
                    @user.save
                    set_session
                    redirect_to user_path(@user)
                else
                    render :new
                end
            else
                render :new
            end
        else
            @landlord = Landlord.new(userable_params)
            if @landlord.valid?
                @landlord.save
                @user = @landlord.build_user(user_params)
                if @user.valid?
                    @user.save
                    set_session
                    redirect_to user_path(@user)
                else
                    render :new
                end
            else
                render :new
            end
        end
    end

    def show
    end
    
    def edit 
    end

    def update
        if @user.userable_type == "Tenant"
            if @tenant.update(userable_params)
                @tenant.save
                redirect_to @user
            else
                render :edit
            end
        elsif @user.userable_type == "Landlord"
            if @landlord.update(userable_params)
                @landlord.save
                redirect_to @user
            else
                render :edit
            end
        else 
            render :edit
        end
    end

    def destroy
        if @tenant
            @tenant.destroy
            current_user.destroy
        else
            @landlord.destroy
            current_user.destroy
        end
        redirect_to root_path
    end

    private

    def user_params
        params.permit(:email, :password)
    end

    def userable_params
        params.permit(:first_name, :last_name, :age, :about)
    end
    
    def set_userable
        if @user.userable_type == "Tenant"
            @tenant = Tenant.find_by(id: @user.userable_id)
        else
            @landlord = Landlord.find_by(id: @user.userable_id)
        end
    end
end

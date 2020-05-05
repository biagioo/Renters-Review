class UsersController < ApplicationController
    before_action :logged_in?, except: [:new, :create]
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
                    render :new, alert: @user.errors
                end
            else
                render :new, alert: @tenant.errors.full_messages
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
                    render :new, alert: @user.errors.full_messages
                end
            else
                render :new, alert: @landlord.errors.full_messages
            end
        end
    end

    def show
        if current_user
            set_userable
        else
            redirect_to root_path
        end
    end
    
    def edit 
        if current_user
            set_userable
        else
            redirect_to root_path
        end
    end

    def update
        current_user
        set_userable
        if @user.userable_type == "Tenant"
            @tenant.update(userable_params)
            @tenant.save
            redirect_to @user
        elsif @user.userable_type == "Landlord"
            @landlord.update(userable_params)
            @landlord.save
            redirect_to @user
        else 
            redirect_to root_path
        end
    end

    private

    def user_params
        params.permit(:email, :password)
    end

    def userable_params
        params.permit(:first_name, :last_name, :age, :about)
    end
    
    def set_userable
        @tenant = Tenant.find_by(id: @user.userable_id)
        @landlord = Landlord.find_by(id: @user.userable_id)
        @tenant || @landlord
    end
end

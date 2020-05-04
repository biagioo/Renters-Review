class UsersController < ApplicationController

    def new
        
    end

    def create
        if params[:landlord] == "0"
            user = Tenant.new.build_user(user_params)
            if user.valid?
                user.save
                t = Tenant.find_by(id: user[:userable_id])
                t.first_name = userable_params[:first_name]
                t.last_name = userable_params[:last_name]
                t.age = userable_params[:age]
                t.about = userable_params[:about]
                t.save
            else
                redirect :new, alert:
            end
        else
            user = Landlord.new.build_user(user_params)
            if user.valid?
                user.save
                l = Landlord.find_by(id: user[:userable_id])
                l.first_name = userable_params[:first_name]
                l.last_name = userable_params[:last_name]
                l.age = userable_params[:age]
                l.about = userable_params[:about]
                l.save
            else
                redirect :new, alert: user.error.full_messages
            end
        end
    end

    def show
    end

    def delete
    end

    private

    def user_params
        params.permit(:email, :password)
    end

    def userable_params
        params.permit(:first_name, :last_name, :age, :about)
    end
    
end

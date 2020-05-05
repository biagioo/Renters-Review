class SessionsController < ApplicationController
   
    def new
    end
   
    def create
      @user = User.find_by(:email => params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:notice] = "Invalid Email or Password. Please try agin."
        render :new
      end
    end
    
    def facebook
      # @tenant = Tenant.find_or_create_by(email: auth['info']['email']) do |t|
      #   t.build_user(first_name: auth['info']['name'], password: SecureRandom.hex)
      # end

      # @user = User.find_or_create_by(uid: auth['uid']) do |u|
      #   u.email = auth['info']['email']
      #   u.password = SecureRandom.hex
      #   u.userable = "Tenant"
        
      # end


      @tenant = Tenant.create(first_name: auth['info']['name'])
      @user = @tenant.build_user(email: auth['info']['email'], password: SecureRandom.hex)
      set_session
      byebug
      redirect_to user_path(@user)
    end

    def destroy
      if current_user
        session.delete :user_id
        redirect_to root_url
      end
    end

    private
 
    def auth
      request.env['omniauth.auth']
    end
    
  end
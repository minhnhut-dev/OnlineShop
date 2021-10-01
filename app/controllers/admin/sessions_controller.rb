class Admin::SessionsController < Admin::AdminController
    def new
    end

    def create
        
        @account = Admin::Admin.find_by(email: params[:email])
        if @account && @account.authenticate(params[:password])
           session[:admin_id] = @account.id
           redirect_to admin_root_path
        else
           redirect_to admin_sign_in_path, notice: "Email or password invalid"
        end
    end
    
    def destroy
        session[:admin_id] = nil
        redirect_to admin_root_path
    end

end

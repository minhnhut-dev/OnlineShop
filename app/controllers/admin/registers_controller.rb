class Admin::RegistersController < Admin::AdminController
    def new
    end

    def create
        @account = Admin::Admin.new(admin_params)
        if @account.save
            redirect_to admin_sign_in_path
        else
            redirect_to admin_sign_up_path, notice: 'Account error'
        end 
    end
    private
    def admin_params
      params.permit(:email, :password, :active, :name) 
    end
end

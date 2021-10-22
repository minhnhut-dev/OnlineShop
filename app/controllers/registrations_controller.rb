class RegistrationsController < Devise::RegistrationsController
    def new
        super
        build_resource({})
        resource.build_address
        respond_with self.resource
      end      
end
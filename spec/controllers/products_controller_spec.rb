require 'rails_helper'
RSpec.describe ProductsController, type: :controller do
    describe "#show" do
        let!(:product){ FactoryBot.create(:product) }
        context "success" do
          it "display a product" do
            get :show, params: {id:  product.id}
            expect(assigns(:product).id).to eq product.id  
           end
        end

        context "failure" do
          it "id not invalid" do
            # id  error
              expect {assigns(:product).id} .to raise_error {ActiveRecord::RecordNotFound} 
          end
        end
        
    end
end
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
            get :show, params: {id: product.id}
            expect(assigns(:product).id).to  be_present, 'Could not find id!'
          end
        end
    end
end
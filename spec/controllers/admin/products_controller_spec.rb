# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  describe " Product #index" do
    let!(:products) { FactoryBot.create_list(:product,2)}
    context "check list product" do
      it 'check list product' do
        get :index
        expect(assigns(:products).size).to eq products.size
      end
    end
    context 'check product is active' do
      let!(:product_active) {FactoryBot.create(:product, active: true)  } 
      let!(:product_deactive) {FactoryBot.create(:product, active: false)  } 
      it 'show all product is active' do
        get :index
        expect(assigns(:products).first).to eq product_active
      end
    end
  end

    describe "#show" do
      let!(:product) { FactoryBot.create(:product)}
      it 'display a product' do
        get :show, params: {id: product.id}
        expect(assigns(:product).id).to  eq product.id
      end 
    end
    
  describe ' #create' do
    let(:category) { FactoryBot.create(:category) } 
    context 'success' do
      it 'create new product' do
          expect{
            post :create, params: FactoryBot.attributes_for(:product, category_id: category) 
          }.to change(Product, :count).by(1)
      end
      it 'redirect admin product page' do
        post :create, params: FactoryBot.attributes_for(:product, category_id: category) 
        expect(response).to redirect_to admin_products_path  
      end
    end
    context 'with invalid attributes' do
      it 'does not change  attributes' do
        expect{ 
          post :create, params: FactoryBot.attributes_for(:invalid_product, category_id: category)
        }.to_not change(Product, :count)
          
      end
      it 'redirect new page ' do
        post :create, params: FactoryBot.attributes_for(:invalid_product, category_id: category)
        expect(response).to redirect_to admin_products_path 
      end
    end
  end
  
  describe "#update" do
    let!(:category) { FactoryBot.create(:category)}
    let!(:product) { FactoryBot.create(:product ) } 
    context 'success' do
      it 'update a product' do
        put :update, params: FactoryBot.attributes_for(:product,id: product.id, name: "Áo len", category_id: category)
        expect(response).to redirect_to admin_products_path
      end
    end
    context "Failure" do
      it 'does not change  attributes' do
        expect{
          put :update, params: FactoryBot.attributes_for(:product, id: product.id, name: "", category_id: category)
        }.to_not change(Product, :count)
      end
      it 'invalid product' do
        put :update, params: FactoryBot.attributes_for(:product, id: product.id, name: "", category_id: category)
        expect(response).to redirect_to admin_products_path  
      end
    end
    
  end
  describe '#destroy' do
     let!(:product) { FactoryBot.create(:product)} 
     it 'delete product' do
       expect{ 
          delete :destroy, params: {id: product.id}
       }.to change(Product, :count).by(-1)
     end
     it 'redirect to product #index' do
      delete :destroy, params: {id: product.id}
      expect(response).to redirect_to admin_products_path  
     end
  end
end

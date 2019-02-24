# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do
    {id: 5, name: 'taro yamada', email_address: 't@example.com', password: '444', password_confirmation: '444'}
  end

  let(:invalid_attributes) do
    {id: 5, name: 'taro yamada', email_address: '', password: ''}
  end

  let(:valid_session) { { user_id: 1 } }

  describe 'GET #index' do
    it 'returns a success response' do
      User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: {}
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect do
          post :create, params: { user: valid_attributes }, session: {}
        end.to change(User, :count).by(1)
      end

      it 'redirects to the created user' do
        post :create, params: { user: valid_attributes }, session: {}
        expect(response).to redirect_to(new_profile_url)
      end
    end

    context 'with invalid params' do
      it 'returns new with errors' do
        post :create, params: { user: invalid_attributes }, session: {}
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'admin user can delete' do
      it 'destroys the requested user' do
        user = User.create! valid_attributes.update(role: :admin)
        expect do
          delete :destroy, params: { id: user.to_param }, session: { user_id: 5 }
        end.to change(User, :count).by(-1)
      end

      it 'redirects to the users list' do
        user = User.create! valid_attributes.update(role: :admin)
        delete :destroy, params: { id: user.to_param }, session: { user_id: 5 }
        expect(response).to redirect_to(users_url)
      end
    end
    context 'non-admin user can not delete' do
      it 'destroys the requested user' do
        user = User.create! valid_attributes.update(role: :user)
        expect do
          delete :destroy, params: { id: user.to_param }, session: { user_id: 5 }
        end.to change(User, :count).by(0)
      end
      it 'redirects to the users list' do
        user = User.create! valid_attributes.update(role: :user)
        delete :destroy, params: { id: user.to_param }, session: { user_id: 5 }
        expect(response).to redirect_to(users_url)
      end
    end
  end
end

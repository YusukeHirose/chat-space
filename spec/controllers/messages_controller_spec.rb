require 'rails_helper'

describe MessagesController, type: :controller do
  #userをcreateし、letに内に格納
  let(:user) { create(:user) }
  let(:group) {create(:group)}
  let(:message) {create(:message)}

  describe 'GET #index' do

    context 'log in' do
      before do
        login_user user
        get :index, params: {group_id: group.id}
      end

      it '@message is instance in message class and is not saved' do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it '@group is instance in group class' do
        expect(assigns(:group)).to eq group
      end

      it 'renders index from message#index' do
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
      before do
        get :index, params: { group_id: group.id}
      end

      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

describe '#create' do
  let(:params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message) } }

  context 'log in' do
    before do
      login_user user
    end
    context 'save' do
      subject {
        post :create,
        params: params
      }

      it 'count up message when user send a message' do
        expect { subject }.to change(Message, :count).by(1)
      end

      it 'redirects to group_messages_path when message#create' do
        subject
        expect(response).to redirect_to(group_messages_path(group))
      end
    end

    context 'cant save' do
      let(:invalid_params) { { group_id: group.id, user_id: user.id, message: attributes_for( :message, body: nil, image: nil)}}

      subject {
        post :create,
        params: invalid_params
      }

      it 'does not count up message becouse invalid_params' do
        expect{ subject }.not_to change(Message, :count)
      end

      it 'redirect to group_messages_path when fail to save' do
        subject
        expect(response).to redirect_to(group_messages_path(group))
      end
    end
  end

    context 'not log in' do
      it 'redirects to new_user_session_path' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end

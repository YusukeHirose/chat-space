require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'save' do
      it 'is valid for message only with body' do
        expect(build(:message, image: nil)).to be_valid
      end

      it 'is valid for message only widh image' do
        expect(build(:message, body: nil)).to be_valid
      end

      it 'is valid for message with body and image' do
        expect(build(:message)).to be_valid
      end
    end

    context 'cant save' do

      it 'is invalid for message without group_id' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include('を入力してください')
      end

      it 'is invalid for message without user_id' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include('を入力してください')
      end

      it 'is invalid for message without body and image' do
        message = build(:message, body: nil, image: nil)
        message.valid?
        expect(message.errors[:body_or_image]).to include("を入力してください。")
      end
    end
  end
end

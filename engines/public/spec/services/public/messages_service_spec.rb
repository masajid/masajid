require 'rails_helper'

describe Public::MessagesService do
  let(:account) { create(:account) }
  let(:params) do
    {
      name: 'test',
      phone: '12345',
      email: email,
      subject: 'subject',
      body: 'body',
      newsletter: newsletter,
      account: account
    }
  end
  let(:newsletter) { '1' }
  let(:email) { Faker::Internet.email }

  let(:service) { described_class.new(account, params) }

  describe '#create' do
    let(:message_delivery) { instance_double(ActionMailer::MessageDelivery) }
    let(:message) { Content::Message.last }

    before do
      allow(Content::MessageMailer).to receive(:user_email).and_return(message_delivery)
      allow(message_delivery).to receive(:deliver_later)
    end

    subject { service.create }

    it { is_expected.to eq(Content::Message.last) }

    it { expect { subject }.to change(Content::Subscriber, :count).by(1) }

    it 'sends email to mosque' do
      subject

      expect(message_delivery).to have_received(:deliver_later)
    end

    context 'when newsletter is equal to 0' do
      let(:newsletter) { '0' }

      it { expect { subject }.not_to change(Content::Subscriber, :count) }
    end

    context 'when email is already subscribed' do
      let!(:subscriber) { create(:subscriber, email: email, account: account) }

      it { expect { subject }.not_to change(Content::Subscriber, :count) }
    end
  end
end

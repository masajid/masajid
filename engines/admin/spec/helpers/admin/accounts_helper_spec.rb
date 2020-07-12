require 'rails_helper'

describe Admin::AccountsHelper do
  describe '#account_class_name_status' do
    subject { helper.account_class_name_status(status) }

    context 'when status is pending' do
      let(:status) { 'pending' }

      it { is_expected.to eq('active') }
    end

    context 'when status is accepted' do
      let(:status) { 'accepted' }

      it { is_expected.to eq('success') }
    end

    context 'when status is declined' do
      let(:status) { 'declined' }

      it { is_expected.to eq('danger') }
    end
  end
end

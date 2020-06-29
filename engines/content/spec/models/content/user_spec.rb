require 'rails_helper'

describe Content::User do
  describe '#super_admin?' do
    let(:user) { build(:user, trait) }

    subject { user.super_admin? }

    context 'when user is super_admin' do
      let(:trait) { :super_admin }

      it { is_expected.to eq(true) }
    end

    context 'when user is admin' do
      let(:trait) { :admin }

      it { is_expected.to eq(false) }
    end

    context 'when user is guest user' do
      let(:trait) { :user }

      it { is_expected.to eq(false) }
    end
  end

  describe '#admin?' do
    let(:user) { build(:user, trait) }

    subject { user.admin? }

    context 'when user is admin' do
      let(:trait) { :admin }

      it { is_expected.to eq(true) }
    end

    context 'when user is super_admin' do
      let(:trait) { :super_admin }

      it { is_expected.to eq(false) }
    end

    context 'when user is guest user' do
      let(:trait) { :user }

      it { is_expected.to eq(false) }
    end
  end
end

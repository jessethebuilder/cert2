require 'spec_helper'

describe Account do
  let(:account){ build :account }

  describe 'Validations' do

  end

  describe 'Associations' do
    it{ should belong_to :user }
    it{ should have_many :transactions }
    it{ should have_many :certs }

  end

  describe 'Defaults' do

    specify '#debits = 0; #credits = 0' do
      a = Account.new
      a.debits.should == 0
      a.credits.should == 0
    end
  end

  describe 'Methods' do
    describe '<<(val)' do
      it 'should add the amount of #val to #credits' do
        expect{ account << 100 }.to change{ account.credits }.by(100)
      end
    end

    describe '>>(val)' do
      it 'should add the amount of #val to #debits' do
        expect{ account >> 100 }.to change{ account.debits }.by(100)
      end
    end
  end
end

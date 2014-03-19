require 'spec_helper'

describe Transaction do
  let(:trans){ build :transaction }
  let(:account){ build :transaction }

  describe 'Validations' do

  end

  describe 'Methods' do

    describe '#debit' do
      before(:each) do
        trans.amount = 100
      end

      it 'should add the amount to #debits on #account' do

      end

      it 'should set #debited to true' do

      end

      it 'should raise an error if no account exists' do

      end
    end
  end

end

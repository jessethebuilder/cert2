require 'spec_helper'

describe Cert do
  let(:cert){ build :cert }

  describe 'Validations' do
    it{ should validate_presence_of :amount }
    it{ should validate_numericality_of(:amount) }
    it 'should not be valid if #amount is less than or equal to 0' do
      cert.amount = -1
      cert.should_not be_valid
      cert.amount = 0
      cert.should_not be_valid
      cert.amount = 1
      cert.should be_valid
    end
    it 'should not be valid if the amount is less than the store minimum' do
      store = create :store
      min = store.minimum_certificate_amount
      cert.amount = min - 1
      cert.valid?.should be_false
      cert.errors[:amount].include?("must be more than the minimum of #{min}")
    end
    it{ should ensure_inclusion_of(:receiver_source).in_array(Cert::SOURCES) }
    it{ should ensure_inclusion_of(:giver_source).in_array(Cert::SOURCES) }
  end
  describe 'Giver' do
    #Reciever follows this same pattern, but is not speced for at this time.
    specify 'if a #giver_identifier is given, a #giver_source must be given, and vice-versa (if a giver_id does not exist)' do
      cert.giver_id = nil
      cert.giver_source = nil
      cert.giver_identifier = Faker::Company.bs
      cert.should_not be_valid

      cert.giver_source = Cert::SOURCES.sample
      cert.should be_valid

      cert.giver_identifier = nil
      cert.should_not be_valid
    end

    it 'should be valid if giver_id exists, regardless of the value in #giver_identifier or #giver_source' do
      cert.giver_source = nil
      cert.giver_identifier = nil
      cert.giver_id = 1
      cert.should be_valid
    end
  end

  describe '#account' do
    it 'should not be valid if #credited is TRUE AND #account_id is NIL' do
      cert.credited = true
      cert.account_id = nil
      cert.should_not be_valid
    end
  end

  describe 'Associations' do
    it{ should belong_to(:receiver).class_name('User') }
    it{ should belong_to(:giver).class_name('User') }
    it{ should belong_to(:account) }
  end

  describe 'Methods' do
    describe '#credit' do
      let(:account){ create :account }

      before(:each) do
        cert.account = account
        cert.amount = 100
      end

      it 'should add amount to #credits on #account' do
        expect{ cert.credit }.to change{ account.credits }.by(100)

      end

      it 'should set #credited to true' do
        expect{ cert.credit}.to change{ cert.credited }.from(nil).to(true)
      end

      it 'should raise an error if credit is called without an #account' do
        cert.account = nil
        expect{ cert.credit }.to raise_error
      end
    end
  end

end

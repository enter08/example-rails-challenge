require 'spec_helper'

describe "TEST" do

before do
  Customer.create!(first_name: 'Johny',
                   last_name: 'Flow')

  Customer.create!(first_name: 'Raj',
                   last_name: 'Jamnis')

  Customer.create!(first_name: 'Andrew',
                   last_name: 'Chung')

  Customer.create!(first_name: 'Mike',
                   last_name: 'Smith')

    5.times do |n|
      Charge.create!(created: rand(1010231), paid: true, amount: rand(3211223), currency: 'USD', refunded: false, customer_id: 1)
    end

    3.times do |n|
      Charge.create!(created: rand(1010231), paid: true, amount: rand(3211223), currency: 'USD', refunded: false, customer_id: 2)
    end

    Charge.create!(created: rand(1010231), paid: true, amount: rand(21332132), currency: "USD", refunded: false, customer_id: 3)
    Charge.create!(created: rand(1010231), paid: true, amount: rand(21332132), currency: "USD", refunded: false, customer_id: 4)

      3.times do |n|
      Charge.create!(created: rand(1010231), paid: false, amount: rand(3211223), currency: "USD", refunded: false, customer_id: 3)
    end

       2.times do |n|
      Charge.create!(created: rand(1010231), paid: false, amount: rand(3211223), currency: "USD", refunded: false, customer_id: 4)
    end

          3.times do |n|
      Charge.create!(created: rand(1010231), paid: true, amount: rand(3211223), currency: "USD", refunded: true, customer_id: 1)
    end

       2.times do |n|
      Charge.create!(created: rand(1010231), paid: true, amount: rand(3211223), currency: "USD", refunded: true, customer_id: 2)
    end
end

describe "Three lists" do

  subject { page }

  describe "there are three lists on the index page" do
    before { visit root_path }
 	  it { should have_selector('h1', text: "Failed Charges")}
  	it { should have_selector('h1', text: "Disputed Charges")}
  	it { should have_selector('h1', text: "Successful Charges")}
  end

 describe "there are 10 items in the successful charges" do
 	before { visit root_path }
 	#it { page.all("table").count.should eql(10) }
 	#it { should have_selector('div.prva')}
 	it { page.all("div.prva table tbody tr").count.should eql(5)}
 	it { page.all("div.druga table tbody tr").count.should eql(5)}
 	it { page.all("div.treca table tbody tr").count.should eql(10)}
 end
end
end
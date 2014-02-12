namespace :db do
  desc "Fill database with user data"
  task populate: :environment do
    make_customers
    make_charges
    #make_relationships
  end
end

def make_customers
          Customer.create!(first_name: 'Johny',
                       last_name: 'Flow')

          Customer.create!(first_name: 'Raj',
                       last_name: 'Jamnis')

          Customer.create!(first_name: 'Andrew',
                       last_name: 'Chung')

          Customer.create!(first_name: 'Mike',
                       last_name: 'Smith')
end

def make_charges
      created = rand(1010231)
      amount = rand(3211223)

    5.times do |n|
      Charge.create!(created: created, paid: true, amount: amount, currency: 'USD', refunded: false, customer_id: 1)
    end

    3.times do |n|
      Charge.create!(created: created, paid: true, amount: amount, currency: 'USD', refunded: false, customer_id: 2)
    end

      Charge.create!(created: rand(1010231), paid: true, amount: rand(21332132), currency: "USD", refunded: false, customer_id: 3)
      Charge.create!(created: rand(1010231), paid: true, amount: rand(21332132), currency: "USD", refunded: false, customer_id: 4)

      3.times do |n|
      Charge.create!(created: created, paid: false, amount: amount, currency: "USD", refunded: false, customer_id: 3)
    end

       2.times do |n|
      Charge.create!(created: created, paid: false, amount: amount, currency: "USD", refunded: false, customer_id: 4)
    end

          3.times do |n|
      Charge.create!(created: created, paid: true, amount: amount, currency: "USD", refunded: true, customer_id: 1)
    end

       2.times do |n|
      Charge.create!(created: created, paid: true, amount: amount, currency: "USD", refunded: true, customer_id: 2)
    end
  end

# def make_charges
#     customers = Customer.first
#     5.times do |n|
#       created = rand(1000)
#       customers.each { |customer| customer.charges.create!(created: created) }

#       customers.each { |customer| customer.charges.create!(paid: true) }

#       amount = rand(10000)
#       customers.each { |customer| customer.charges.create!(amount: amount) }

#       customers.each { |customer| customer.charges.create!(currency: "USD") }

#       customers.each { |customer| customer.charges.create!(refunded: false) }

#       customers.each { |customer| customer.charges.create!(customer_id: 1) }
#     end

#     all_c = Customer.all
#     second = all_c[1]

#     3.times do |n|
#       second.each { |customer| customer.charges.create!(currency: "USD") }

#       second.each { |customer| customer.charges.create!(refunded: false) }

#       second.each { |customer| customer.charges.create!(customer_id: 2) }

#       created = rand(1000)
#       second.each { |customer| customer.charges.create!(created: created) }

#       second.each { |customer| customer.charges.create!(paid: true) }

#       amount = rand(100000)
#       second.each { |customer| customer.charges.create!(amount: amount) }
#     end

# #    third = all_c[2]

# end

# def make_relationships
#   customers = Customer.all
#   customer = customers.first
#   followed_users = users[2..50]
#   followers = users[3..40]
#   followed_users.each { |followed| user.follow!(followed) }
#   followers.each { |follower| follower.follow!(user) }
# end
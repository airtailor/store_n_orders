
# Stores

```
airtailor = Retailer.create(name: "Air Tailor")

Retailer.first
  => #<Retailer id: 1, name: "Air Tailor", created_at: "2017-06-08 05:04:24", updated_at: "2017-06-08 05:04:24", type: "Retailer">

Store.first 
  => #<Retailer id: 1, name: "Air Tailor", created_at: "2017-06-08 05:06:59", updated_at: "2017-06-08 05:06:59", type: "Retailer">

Tailor.first 
  => nil
  # No Tailors Exist Yet

Headquarters.first 
  => nil
  # No Headquarters Exist Yet

burberry = Retailer.create(name: "Burberry")

joes = Tailor.create(name: "Joes")

burberry_hq = Headquarters.create(name: "Burberry Headquarters")

Store.all
  => #<ActiveRecord::Relation [#<Retailer id: 1, name: "Air Tailor", created_at: "2017-06-08 05:54:18", updated_at: "2017-06-08 05:54:18", type: "Retailer">, #<Retailer id: 2, name: "Burberry", created_at: "2017-06-08 05:55:32", updated_at: "2017-06-08 05:55:32", type: "Retailer">, #<Tailor id: 3, name: "Joes", created_at: "2017-06-08 05:55:36", updated_at: "2017-06-08 05:55:36", type: "Tailor">, #<Headquarters id: 4, name: "Burberry Headquarters", created_at: "2017-06-08 05:55:56", updated_at: "2017-06-08 05:55:56", type: "Headquarters">]>
  # Includes All 4 Stores, each with their own class and incremented store id's

Retailer.all 
  => #<ActiveRecord::Relation [#<Retailer id: 1, name: "Air Tailor", created_at: "2017-06-08 05:06:59", updated_at: "2017-06-08 05:06:59", type: "Retailer">, #<Retailer id: 2, name: "Burberry", created_at: "2017-06-08 05:08:19", updated_at: "2017-06-08 05:08:19", type: "Retailer">]>
  # Includes Only the Retail Stores, no tailors here

Tailor.all 
  => #<ActiveRecord::Relation [#<Tailor id: 3, name: "Joes", created_at: "2017-06-08 05:09:17", updated_at: "2017-06-08 05:09:17", type: "Tailor">]>
  # Includes Only the Tailors, no retailers here

Headquarters.all 
  => #<ActiveRecord::Relation [#<Headquarters id: 4, name: "Burberry Headquarters", created_at: "2017-06-08 05:55:56", updated_at: "2017-06-08 05:55:56", type: "Headquarters">]>
  # Includes Only the Headquarters, no retailers or tailors here

joes_retailer = Retailer.create(name: "Joes")

Store.where(name: "Joes")
  => #<ActiveRecord::Relation [#<Tailor id: 3, name: "Joes", created_at: "2017-06-08 05:09:17", updated_at: "2017-06-08 05:09:17", type: "Tailor">, #<Retailer id: 4, name: "Joes", created_at: "2017-06-08 05:15:30", updated_at: "2017-06-08 05:15:30", type: "Retailer">]>
  # Includes All Stores Where Name is Joes, tailors and retailers can have the same name

new_tailor = Tailor.create(name: "Joes")
  => rollback transaction
  # Didnt Make New Tailor 

new_tailor.errors.messages 
  => {:name=>["has already been taken"]}
  # We Cant Make Two Tailors With the Same Name

new_retail = Retailer.create(name: "Burberry")
  => rollback transaction

new_retail.errors.messages
  => {:name=>["has already been taken"]}
  # We Cant Make Two Retailers With the Same Name
```

# Orders 

```
airtailor = Retailer.create(name: "Air Tailor")

hello = WelcomeKit.create(name: "Hello!", retailer: airtailor)

hello.retailer 
  => #<Retailer id: 12, name: "Air Tailor", created_at: "2017-06-08 06:26:16", updated_at: "2017-06-08 06:26:16", type: "Retailer">

hello.stores
  => {:retailer=>#<Retailer id: 12, name: "Air Tailor", created_at: "2017-06-08 06:26:16", updated_at: "2017-06-08 06:26:16", type: "Retailer">}

WelcomeKit.all 
  => #<ActiveRecord::Relation [#<WelcomeKit id: 7, name: "Hello!", retailer_id: 12>]>

TailorOrder.first
  => #<TailorOrder id: 6, name: "Hello!", retailer_id: 8>
  # SHOULDNT HAVE THE WELCOME KIT STUFF
  # TRY TOMORROW TO REMOVE THE RETAILER FROM THE ORDER

** Uninitialized constant TailorOrder
 -- => nil 
  --# TailorOrder is not the same class as WelcomeKit

joes = Tailor.create(name: "Joes")

--pants = Order.create(name: "Pants", retailer: airtailor)

--pants.stores 
    => {:retailer=>#<Retailer id: nil, name: "Air Tailor", created_at: nil, updated_at: nil, type: "Retailer">}

--joes = Tailor.create(name: "Joes")

--shirt = Order.create(name: "Shirt", retailer: joes)
  => #<ActiveRecord::Relation []> irb(main):006:0> shirt = Order.create(name: "Shirt", retailer: joes) ActiveRecord::AssociationTypeMismatch: Retailer(#70248135940600) expected, got #<Tailor id: 10, name: "Joes", created_at: "2017-06-08 06:18:54", updated_at: "2017-06-08 06:18:54", type: "Tailor"> which is an instance of Tailor(#70248156812820)
  # Cant Add a Tailor as a Retailor

```

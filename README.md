
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

hello = WelcomeKit.create(name: "Hello!")

hello.retailer 
  => #<Retailer id: 1, name: "Air Tailor", created_at: "2017-06-08 19:13:39", updated_at: "2017-06-08 19:13:39", type: "Retailer">
  # automatically airtailor 

WelcomeKit.all 
  => #<ActiveRecord::Relation [#<WelcomeKit id: 7, name: "Hello!", retailer_id: 12>]>

TailorOrder.first
  => nil

TailorOrder.create(name: "Pants", retailer: airtailor)
  => rollback 
  # no tailor provided

pants = TailorOrder.create(name: "Pants", retailer: airtailor, tailor: joes)

pants.tailor 
  => #<Tailor id: 3, name: "Joes", created_at: "2017-06-08 19:13:53", updated_at: "2017-06-08 19:13:53", type: "Tailor">

pants.retailer 
  => #<Retailer id: 1, name: "Air Tailor", created_at: "2017-06-08 19:13:39", updated_at: "2017-06-08 19:13:39", type: "Retailer">

pants.stores
  => {:retailer=>#<Retailer id: 1, name: "Air Tailor", created_at: "2017-06-08 19:13:39", updated_at: "2017-06-08 19:13:39", type: "Retailer">, :tailor=>#<Tailor id: 3, name: "Joes", created_at: "2017-06-08 19:13:53", updated_at: "2017-06-08 19:13:53", type: "Tailor">}

pants.retailer.orders
  => #<ActiveRecord::Relation [#<TailorOrder id: 3, name: "Pants", requester_id: 1, provider_id: 3, type: "TailorOrder">, #<TailorOrder id: 4, name: "Shirt", requester_id: 1, provider_id: 3, type: "TailorOrder">, #<TailorOrder id: 5, name: "Shirt", requester_id: 1, provider_id: 3, type: "TailorOrder">]>

pants.tailor.orders 
  => #<ActiveRecord::Relation [#<TailorOrder id: 3, name: "Pants", requester_id: 1, provider_id: 3, type: "TailorOrder">, #<TailorOrder id: 4, name: "Shirt", requester_id: 1, provider_id: 3, type: "TailorOrder">, #<TailorOrder id: 5, name: "Shirt", requester_id: 1, provider_id: 3, type: "TailorOrder">, #<TailorOrder id: 6, name: "Socks", requester_id: 2, provider_id: 3, type: "TailorOrder">]>
```

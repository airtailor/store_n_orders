
# Stores

```
airtailor = Retailer.new(name: "Air Tailor")

airtailor.save

Retailer.first
  => #<Retailer id: 1, name: "Air Tailor", created_at: "2017-06-08 05:04:24", updated_at: "2017-06-08 05:04:24", type: "Retailer">

Store.first 
  => #<Retailer id: 1, name: "Air Tailor", created_at: "2017-06-08 05:06:59", updated_at: "2017-06-08 05:06:59", type: "Retailer">

Tailor.first 
  => nil
  # No Tailors Exist Yet

burberry = Retailer.create(name: "Burberry")

joes = Tailor.create(name: "Joes")

Store.all
  => #<ActiveRecord::Relation [#<Retailer id: 1, name: "Air Tailor", created_at: "2017-06-08 05:06:59", updated_at: "2017-06-08 05:06:59", type: "Retailer">, #<Retailer id: 2, name: "Burberry", created_at: "2017-06-08 05:08:19", updated_at: "2017-06-08 05:08:19", type: "Retailer">, #<Tailor id: 3, name: "Joes", created_at: "2017-06-08 05:09:17", updated_at: "2017-06-08 05:09:17", type: "Tailor">]>
  # Includes All 3 Stores, each with their own class and incremented store id's

Retailer.all 
  => #<ActiveRecord::Relation [#<Retailer id: 1, name: "Air Tailor", created_at: "2017-06-08 05:06:59", updated_at: "2017-06-08 05:06:59", type: "Retailer">, #<Retailer id: 2, name: "Burberry", created_at: "2017-06-08 05:08:19", updated_at: "2017-06-08 05:08:19", type: "Retailer">]>
  # Includes Only the Retail Stores, no tailors here

Tailor.all 
  => #<ActiveRecord::Relation [#<Tailor id: 3, name: "Joes", created_at: "2017-06-08 05:09:17", updated_at: "2017-06-08 05:09:17", type: "Tailor">]>
  # Includes Only the Tailors, no retailers here

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

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,cash)
  pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, sold)
  pet_shop[:admin][:pets_sold] += sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop,breed)
array = []
  for dogs in pet_shop[:pets]
    array.push(dogs[:breed]) if dogs[:breed] == breed
    end
  return array
end

def find_pet_by_name(pet_shop, dog_name)
  for dog in pet_shop[:pets]
    if dog[:name] == dog_name
      return dog
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, dog_name)
  for dog in pet_shop[:pets]
    if dog[:name] == dog_name
      # index_of_dog_delete = dog.index(dog_name)
      dog.delete(dog.index(dog_name))
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash)
  customer[:cash] -= cash
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop ,new_pet ,customer)
    pets_owned = customer_pet_count(customer)
    if new_pet != nil
      if customer_can_afford_pet(customer, new_pet) == true
        add_pet_to_customer(customer, new_pet)
         remove_customer_cash(customer, new_pet[:price])
          add_or_remove_cash(pet_shop,new_pet[:price])
           pets_owned = customer_pet_count(customer) - pets_owned
            increase_pets_sold(pet_shop,pets_owned)
          end
      end
end

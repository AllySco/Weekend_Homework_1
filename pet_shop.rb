def pet_shop_name(petshop)
  return petshop[:name]
end



def total_cash(petshop)
  return petshop[:admin][:total_cash]
end



def add_or_remove_cash(petshop, add_remove)
  total_cash = petshop[:admin][:total_cash] += add_remove
end



def pets_sold(petshop)
  sold = petshop[:admin][:pets_sold]
end  



def increase_pets_sold(petshop, pet_sales)
  sold = petshop[:admin][:pets_sold] += pet_sales
end



def stock_count(petshop)
  stock_count = petshop[:pets].length
end



def pets_by_breed(petshop, breed)
  pets = []
  for animal in petshop[:pets]
    if animal[:breed] == breed
      pets << animal
    end

    # petshop[:pets].each do |animal|
    # if animal[:breed] == breed
    #   pets << animal
    # end
  end
  return pets
end



def find_pet_by_name(petshop, pet_name)
  for animal in petshop[:pets]
    if animal[:name] == pet_name
      return animal
    end
  end
  return nil
end



def remove_pet_by_name(petshop, pet_name)
  all_pets = petshop[:pets]
  all_pets.delete_if { |animal| animal[:name] == pet_name }
end


def add_pet_to_stock(petshop, new_pet)
  all_pets = petshop[:pets]
  all_pets << new_pet
end



def customer_pet_count(customers)
  return customers[:pets].count
end



def add_pet_to_customer(customers, new_pet)
  customers[:pets] << new_pet
end



def customer_can_afford_pet(customers, new_pet)
  customer_can_afford_pet = customers[:cash] >= new_pet[:price]
end



def sell_pet_to_customer(petshop, pet, customers)
  pet_available = petshop[:pets].include?(pet)
    take_customer_cash = customers[:cash] - 900

  if pet_available && customer_can_afford_pet(customers, pet)
    
    take_customer_cash
    add_pet_to_customer(customers, pet)
    remove_pet_by_name(petshop, pet)
    add_or_remove_cash(petshop, 900)
    increase_pets_sold(petshop, 1)
  end
  return nil
end















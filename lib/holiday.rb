require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  # return the updated hash
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  
  holiday_hash.each do |season, holidays|
    # .capitalize returns capitalized string but doesn't change the OG string 
    # use captialize! 
    season = season.to_s.capitalize + ":"
    puts season
    holidays.each do |holiday, supplies|
      holiday = holiday.to_s
      if holiday.include?("_")
        holiday = holiday.split("_").map {|word| word.capitalize}.join(" ")
        puts "  #{holiday}: #{supplies.join(", ")}"
      else
        puts "  #{holiday.capitalize!}: #{supplies.join(", ")}"
      end
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_array = []
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
      if supplies.include?("BBQ")
        bbq_array << holiday
      end
    end
  end
  bbq_array
end

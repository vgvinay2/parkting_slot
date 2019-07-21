# require 'byebug'
@main_hash = {}
@next_key = 1.0
@next_slot_number = 1
@max_slot_number = 6
@max_key = @max_slot_number/2 + 0.1
@next_slot = []
@next_key_slot = []

def park(parcel_code, parcel_weight)
    return "Sorry, parcel slot is full" if (@next_key > @max_key && @next_key_slot.empty?)

    if  @next_key_slot.length > 0
        @main_hash[@next_key_slot.first] = { slot_number: @next_slot.first, parcel_code: parcel_code, parcel_weight: parcel_weight  }
        puts "Allocated slot number: #{@next_slot.first}"
        @next_key_slot.shift
        @next_slot.shift
    else
        @main_hash[@next_key] = { slot_number: @next_slot_number, parcel_code: parcel_code, parcel_weight: parcel_weight  }
        puts "Allocated slot number: #{@next_slot_number}"
        calculate_next_key
        calculate_next_slot_number
    end
end

def calculate_next_key
    if @next_key%1 == 0
        @next_key += 0.1
    else
        @next_key = @next_key + 1 - 0.1
    end
end

def calculate_next_slot_number
    @next_slot_number = if @next_key%1 == 0
        @next_key.to_i
    else
        @max_slot_number + 1 - @next_key.to_i
    end
end

def create_parcel_slot_lot(number)
    puts "Created a parcel slot with #{number} slots"
end

def leave_for_delivery(slot_number)
    @main_hash.select {|k, v| v[:parcel_code], v[:parcel_weight], v[:slot_number] = nil if v[:slot_number] == slot_number && !v[:parcel_code].nil? }
    @next_slot << slot_number
    @main_hash.select{ |h, k| @next_key_slot << h if k[:slot_number].nil? }
    @next_key_slot.uniq!
    puts "slot #{slot_number} is free"
end

def status
    hash = @main_hash.reject { |k, v| v[:slot_number].nil? }
    @m = hash.values
    puts "slot_number  parcel_code  parcel_weight"
    puts @m.collect { |p| "#{p[:slot_number]}            #{p[:parcel_code]}               #{p[:parcel_weight]}" }
end

def slot_number_for_registration_number(regis_no)
    slots = []
    @main_hash.each do |k, v|
      if v[:parcel_code] == regis_no
        slots << v[:slot_number]
     end
   end
   slots.length > 0 ? puts(slots.join(' ')) : puts("Not Found")
end

def parcel_code_for_parcels_with_weight(weight)
    slots = []

    @main_hash.each do |k, v|
      if v[:parcel_weight] == weight
        slots << v[:parcel_code]
     end
   end
   puts "Sorry, parcel slot is full"
   slots.length > 0 ? puts(slots.join(', ')) : puts("Not Found")
end

def slot_numbers_for_parcels_with_weight(weight)
    slots = []

    @main_hash.each do |k, v|
      if v[:parcel_weight] == weight
        slots << v[:slot_number]
     end
   end
   slots.length > 0 ? puts(slots.join(' ')) : puts("Not Found")
end
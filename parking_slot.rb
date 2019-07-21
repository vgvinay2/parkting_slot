require './utill'
File.open("input.txt", "r") do |f|
    f.each_line do |line|
        string_array = line.split(' ')
        method_name = string_array[0]

        case method_name
        when "create_parcel_slot_lot"
            send(:create_parcel_slot_lot, string_array[1])
        when "park"
            send(:park, string_array[1], string_array[2])
        when "status"
            send(:status)
        when "leave_for_delivery"
            send(:leave_for_delivery, string_array[1].to_i)
        when "parcel_code_for_parcels_with_weight"
            send(:parcel_code_for_parcels_with_weight, string_array[1])
        when "slot_numbers_for_parcels_with_weight"
            send(:slot_numbers_for_parcels_with_weight, string_array[1])
        when "slot_number_for_registration_number"
            send(:slot_number_for_registration_number, string_array[1])
        end
    end
end
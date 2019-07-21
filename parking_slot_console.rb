require './utill'
def execute_method(method_name, string_array)
    case method_name
    when "create_parking_lot"
        send(:create_parcel_slot_lot, string_array[1]= 6)
        get_input
    when "park"
        send(:park, string_array[1], string_array[2])
        get_input
    when "status"
        send(:status)
        get_input
    when "leave_for_delivery"
        send(:leave_for_delivery, string_array[1].to_i)
        get_input
    when "parcel_code_for_parcels_with_weight"
        send(:parcel_code_for_parcels_with_weight, string_array[1])
        get_input
    when "slot_numbers_for_parcels_with_weight"
        send(:slot_numbers_for_parcels_with_weight, string_array[1])
        get_input
    when "slot_number_for_registration_number"
        send(:slot_number_for_registration_number, string_array[1])
        get_input
    end
end

def get_input
    puts "Input:"
    line = gets.chomp
    string_array = line.split(' ')
    method_name = string_array[0]
    execute_method(method_name, string_array)
end

    puts "Input:"
    line = gets.chomp
    string_array = line.split(' ')
    method_name = string_array[0]
    execute_method(method_name, string_array)
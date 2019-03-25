ActiveAdmin.register Booking do

permit_params :start_time, :end_time, :length, :name

end

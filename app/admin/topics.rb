ActiveAdmin.register Topic do

permit_params :user_id, :title, :body, :datetime

end
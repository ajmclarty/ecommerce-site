ActiveAdmin.register Product do
	form do |f|
		f.inputs do 
			f.input :category
			f.input :name
			f.input :quantity
			f.input :price
			f.input :description
		end
		f.input "image" do
			f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:medium))
		end 
		f.actions
	end
end

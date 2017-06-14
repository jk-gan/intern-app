# == Schema Information
#
# Table name: companies
#
#  id                :integer          not null, primary key
#  name              :string
#  description       :text
#  size              :integer
#  website           :text
#  status            :integer          default("pending")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  logo_file_name    :string
#  logo_content_type :string
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

FactoryGirl.define do
  factory :company do
    name "Company 1"
    description "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sollicitudin sem in viverra mattis. Cras hendrerit fermentum ullamcorper. Phasellus a enim sit amet risus laoreet fringilla ac consequat tellus. Pellentesque turpis risus, porta ac sodales semper, gravida et ipsum. Maecenas dolor ipsum, sollicitudin a sapien eu, porttitor ullamcorper tortor. Sed tincidunt est non felis pretium, at pretium nunc ullamcorper. Ut vulputate commodo varius. Aliquam porttitor ipsum sed ipsum pellentesque, eget tempor metus mattis. Aliquam maximus, nibh ut dictum eleifend, nulla est sollicitudin libero, eget feugiat libero ex eu velit. Etiam non ullamcorper odio, a vestibulum risus. Vivamus rhoncus ac odio vel imperdiet."
    size 1000
    website "www.company1.com"
    status 0
  end
end

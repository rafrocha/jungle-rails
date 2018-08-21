require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
 before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "User clicks on a product" do

    visit root_path

    first('article.product').find_link('Add').click
    # ACT


    # VERIFY
    expect(page).to have_css 'section.product-show'
  end
end

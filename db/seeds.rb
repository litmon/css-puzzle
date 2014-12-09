# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puzzles = Puzzle.create([{"title"=>"test3", "description"=>"test", "styles_attributes"=>{"0"=>{"state"=>"init", "selectors_attributes"=>{"0"=>{"name"=>"div", "properties_attributes"=>{"0"=>{"name"=>"color", "value"=>"#000"}}}}}, "1"=>{"state"=>"goal", "selectors_attributes"=>{"0"=>{"name"=>"div", "properties_attributes"=>{"0"=>{"name"=>"color", "value"=>"#f00"}}}}}}},
	{"title"=>"test4", "description"=>"test", "styles_attributes"=>{"0"=>{"state"=>"init", "selectors_attributes"=>{"0"=>{"name"=>"div", "properties_attributes"=>{"0"=>{"name"=>"font-size", "value"=>"30px"}}}}}, "1"=>{"state"=>"goal", "selectors_attributes"=>{"0"=>{"name"=>"div", "properties_attributes"=>{"0"=>{"name"=>"font-size", "value"=>"40px"}}}}}}},
	{"title"=>"test5", "description"=>"test", "styles_attributes"=>{"0"=>{"state"=>"init", "selectors_attributes"=>{"0"=>{"name"=>"div", "properties_attributes"=>{"0"=>{"name"=>"border", "value"=>"1px double #000"}}}}}, "1"=>{"state"=>"goal", "selectors_attributes"=>{"0"=>{"name"=>"div", "properties_attributes"=>{"0"=>{"name"=>"border", "value"=>"3px solid #f00"}}}}}}}])


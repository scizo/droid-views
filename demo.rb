
module Android
  class View
    def initialize(properties)
    end
  end
end


declare_view :linear_layout do |v|
  properties :orientation, :layout_width, :layout_height
end

->

views[:linear_layout] = Android::View.new(:orientation, :layout_width, :layout_height)
views[:special_layout] = Android::SpecialView.new(:orientation, :layout_width, :layout_height)

declare_view :text_view do
end



view :name => "my_file", :type => :linear_layout do |v|
  v.orientation    'vertical'
  v.layout_width   'fill_parent'
  v.layout_height 'fill_parent'

  v.sub_view :text_view do |tv|
    tv.layout_width 'fill_parent'
    tv.layout_height 'fill_parent'
    tv.text 'Hello World'
  end
end

view :name => "my_file2", :type => :linear_layout do |v|
  v.orientation    'vertical'
  v.layout_width   'fill_parent'
  v.layout_height 'fill_parent'

  v.sub_view :text_view do |tv|
    tv.layout_width 'fill_parent'
    tv.layout_height 'fill_parent'
    tv.text 'Hello World'
  end
end

----------------------------------------------------------------------

clear_xml_data_stuff
require 'my_file'
open("my_file.xml", "w") do |f| f.puts xml_data_stuff.to_xml end

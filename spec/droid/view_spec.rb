require_relative '../spec_helper'

class Main < Droid::View

  linear_layout do |ll|
    ll.orientation   = :vertical
    ll.layout_width  = :fill_parent
    ll.layout_height = :fill_parent

    text_view do |tv|
      tv.layout_width  = :fill_parent
      tv.layout_height = :fill_parent
      tv.text = "Hello World"
    end

    text_view do |tv|
      tv.layout_width  = :fill_parent
      tv.layout_height = :fill_parent
      tv.text = "Goodbye"
    end
  end

end

correct_xml_for_main = <<-END
<?xml version="1.0" encoding="UTF-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android" android:orientation="vertical" android:layout_width="fill_parent" android:layout_height="fill_parent">
  <TextView android:layout_width="fill_parent" android:layout_height="fill_parent" android:text="Hello World"/>
  <TextView android:layout_width="fill_parent" android:layout_height="fill_parent" android:text="Goodbye"/>
</LinearLayout>
END

describe 'Droid::View#render' do

  it "should create correct XML" do
    Main.render.should == correct_xml_for_main
  end

end



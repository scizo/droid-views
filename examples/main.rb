require 'droid_views'


ll = LinearLayout.new do |layout|
  layout.orientation   = 'vertical'
  layout.layout_width  = 'fill_parent'
  layout.layout_height = 'fill_parent'
  
  tv = TextView.new do |view|
    view.layout_width = 'fill_parent'
    view.layout_height = 'fill_parent'
    view.text = 'Hello World'
  end
  layout.add(tv)

end

view_register(ll)


=begin
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent"
    >
<TextView  
    android:layout_width="fill_parent" 
    android:layout_height="wrap_content" 
    android:text="Hello World, HaggisHead"
    />
</LinearLayout>
=end

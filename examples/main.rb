require '../droid_views'

class Main < DroidView

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

Main.render


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
    android:text="Hello World"
    />
<TextView
    android:layout_width="fill_parent"
    android:layout_height="wrap_content"
    android:text="Goodbye"
    />
</LinearLayout>
=end

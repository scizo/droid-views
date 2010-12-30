require 'droid_views'

rl = RelativeLayout.new do |layout|  
  layout.layout_width = "match_parent"
  layout.layout_height = "?android:attr/listPreferredItemHeight"
  layout.padding = "6dip"  

  iv = ImageView.new do |iv|
    iv.id = "@+id/accountIcon"
    iv.layout_width = "wrap_content"
    iv.layout_height = "match_parent"
    iv.layout_alignParentTop = "true"
    iv.layout_alignParentBottom = "true"
    iv.layout_marginRight = "6dip"
  end
  layout.add(iv)
    
  tv = TextView.new do |tv|
    tv.id = "@+id/secondAccountLine"
    tv.layout_width = "match_parent"
    tv.layout_height = "26dip"
    tv.layout_toRightOf = "@id/accountIcon"
    tv.layout_alignParentBottom = "true"
    tv.layout_alignParentRight = "true"
    tv.singleLine = "true"
    tv.ellipsize = "marquee"
    tv.textColor = "@android:color/secondary_text_light"
  end
  layout.add(tv)
    
  tv = TextView.new do |tv|
    tv.id = "@+id/firstAccountLine"
    tv.layout_width = "match_parent"
    tv.layout_height = "wrap_content"
    tv.layout_toRightOf = "@id/accountIcon"
    tv.layout_alignParentRight = "true"
    tv.layout_alignParentTop = "true"
    tv.layout_above = "@id/secondAccountLine"
    tv.layout_alignWithParentIfMissing = "true"
    tv.gravity = "center_vertical"
    tv.textColor = "@android:color/primary_text_light"
  end
  layout.add(tv)
  
end

view_register(rl)
require '../droid_views'


class AccountEntry < DroidView
  
  relative_layout do |layout|  
    layout.layout_width   = :match_parent
    layout.layout_height  = "?android:attr/listPreferredItemHeight"
    layout.padding        = "6dip"  

    image_view do |iv|
      iv.id            = "@+id/accountIcon"
      iv.layout_width  = :wrap_content
      iv.layout_height = :match_parent
      iv.layout_align_parent_top    = true
      iv.layout_align_parent_bottom = true
      iv.layout_margin_right = "6dip"
    end
    
    text_view do |tv|
      tv.id            = "@+id/secondAccountLine"
      tv.layout_width  = :match_parent
      tv.layout_height = "26dip"
      tv.layout_to_right_of = "@id/accountIcon"
      tv.layout_align_parent_bottom = true
      tv.layout_align_parent_right  = true
      tv.singleLine = true
      tv.ellipsize  = :marquee
      tv.textColor  = "@android:color/secondary_text_light"
    end
    
    text_view do |tv|
      tv.id            = "@+id/firstAccountLine"
      tv.layout_width  = :match_parent
      tv.layout_height = :wrap_content
      tv.layout_to_right_of = "@id/accountIcon"
      tv.layout_align_parent_right = true
      tv.layout_align_parent_top   = true
      tv.layout_above = "@id/secondAccountLine"
      tv.layout_align_with_parent_if_missing = :true
      tv.gravity    = :center_vertical
      tv.text_color = "@android:color/primary_text_light"
    end
  
end

AccountEntry.render
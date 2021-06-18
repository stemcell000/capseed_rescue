module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Capseed"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  # Replace 
  def char_replace(str="")
    if str.present?
      str.gsub(" ", "_")
   end
  end
  
  #def title(page_title, show_title = true)
   # @show_title = show_title
   # @content_for_title = page_title.to_s
  #end

  #def show_title?
   # @show_title
  #end
  
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end
  
  #Sortable columns
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

#Format name of step from number (production only)
def stepToStringProd(step_id)
 @hash ={}
  case step_id
  when 0
    s = "Creation"
  when 1
    s = "Production design"
  when 2
    s = "Virus Production"
  when 3
    s = "Closed"
   end 
   return s
end

def formatDate(d)
   if d
    d.strftime("%h %e, %Y ")
   end
end

 def cb_display(collection)
  r = ""
  
  unless collection.empty?
    r = collection.map {|c| c.number+c.name+"- "+c.type.name[0..3]}
  else
    r = "No data yet"
  end

  return r

end

def clone_display(collection)
   r = ""
    if !collection.empty?
      r = collection.order(:id).map {|c| c.name+" | "+c.id.to_s}.to_sentence
    else
      r="Add a construction!"
    end
  return r
end

def display_collection(collection)
   r = ""
  if !collection.empty?
    r = collection.order(:id).map {|c| c.name }.to_sentence
  else
    r="-"
  end
  return r
end

def cb_flag(i)
 flag = ""
 
 case i
 when i=1
  flag = "(Help.)"
 when i=2
  flag = "(Trans.)"
 when i=3
  flag = "(Caps.)"
 when i=4
  flag = "(Libr.)"
 else
  flag=""   
 end
 
end

def colorize(vol)
  str=""
  if vol.nil? || vol == 0
    str="red"
  else
    str="#009933"
  end
  return str
end

def pluralize_without_count(count, noun, text = nil)
  if count != 0
    count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
  end
end

def massive_files_attachment(folder_name, object_list, attachmentModel)
      begin
      #Starting values
        origin = File.join(Rails.root, folder_name)
        Dir.chdir(origin)
        files_names = Dir.entries(".")
      #Loop over the items
        object_list.each do |object|
          if files_names.include? object.barcode
            puts("Object has folder.")
            object_dir = File.join(origin, object.barcode)
            Dir.chdir(object_dir)
            Dir.glob("*").each do |file_name|
              puts("files selection.")
              src = File.join(object_dir, file_name)
              object_attachment = attachmentModel.new()
              puts("attachement creation.")
              object_attachment.attachment = File.new(src)
              puts("file saving.")
              object_attachment.save
              object.item_attachments << object_attachment
            end
          end
        end
    end
      rescue Errno::ENOENT
      puts "Unkown folder."  
  end

end

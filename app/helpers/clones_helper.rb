module ClonesHelper

def clone_display(collection)
   r = ""
    if !collection.empty?
      r = collection.order(:id).map {|c| "#{c.id.to_s} | #{c.name}"}.to_sentence
    else
      r="Add a construction!"
    end
  return r
end
end

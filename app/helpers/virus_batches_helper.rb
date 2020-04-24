module VirusBatchesHelper
  def set_color_from_position(b)
    str=""
    str = b.position.nil? ? "text-primary" : "text-success"
    return str
  end
end

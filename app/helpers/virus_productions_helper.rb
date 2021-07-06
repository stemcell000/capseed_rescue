module VirusProductionsHelper

  def scientific_notation(i)
    sci = "%e" %i
    return sci
  end
  
  def int_to_string(a)
    b=""
    case a
    when 0
      b = "not done"
    when 1
      b = "sterile"
    when 3
      b = "not sterile" 
    end
    return b
  end
  
  def isavailable(obj)
    if obj.virus_batches.pluck(:trash) == [true]
      "info"
    end
  end
  
  def invcolor(obj)
    if obj.dismissed == 1
      "danger"
    elsif obj.virus_batches.pluck(:trash) == [true]
      "discarded"
    end
  end

  def recap_builder
      block1 = "<strong>Associated plasmids: </strong>"
      block2=""
      block3=""
      block4=""
      block5=""
      block6=""
      block7=""
      block8=""
      block9=""
      block10=""
      block11=""
                
    if self.clone_batches.empty?
      block2="No plasmid<br />"
      block3=""
      block4=""
    else
      block2="<table>"
          
     self.clone_batches.each do |cb| 
      
      block3="<tr><td> #{ cb.number } - </td><td>  #{ cb.name } </td><tr>" + block3
     end
     
      block4="</table>"
    end
    date_of_prod = self.date_of_production.nil? ? "none" : self.date_of_production.strftime("%b %e, %Y")
    projects = self.production.nil? ? "none" : self.production.projects.pluck(:name).to_sentence
    user =  self.user.nil? ? "none" : self.user.full_name
    volume =  self.vol.nil? ? "none" : "#{self.vol} #{self.vol_unit.name}"
    
      unless self.sterilitytests.nil?
        last_st = self.sterilitytests.last 
                  if last_st
                    last_st_date = last_st.date.nil? ? "none" : last_st.date.strftime("%b %e, %Y")
                    sterility_result = last_st.sterility.nil? ? "on-going" : int_to_string(last_st.sterility)
                    block5 = "#{last_st_date} <br /><strong>Last result for sterility : </strong> #{ sterility_result} <br />"
                  end
       else
                    block5=""
       end
           
      block6="<strong>Date of prod.: </strong> #{date_of_prod} <br />
             <strong>Project: </strong> #{projects} <br />
             <strong>Contact: </strong> #{user} <br />
             <strong>Volume: </strong> #{volume} <br />"
                 
       gel_prot = self.gel_prot.nil? ? "none" : self.gel_prot
  
       block7= "<strong>Gel (Prot.) : #{gel_prot} </strong> <br />"
       
       hek_result = self.hek_result 
       comment = self.comment
          unless self.hek_result.blank?
       block8 = "<strong>HEK results : </strong> #{hek_result} <br />"
       else
         block8=""
          end
          unless self.comment.blank?
           block9 = "<strong>Comment : </strong> #{comment}<br />"
        else
          block9=""
          end
           last_dosage = self.dosages.last
           inactivation_count = pluralize_without_count(self.dosages.count, 'Inactivation' , ' :')
           inactivation_dates = self.dosages.pluck(:inactivation).uniq
           inactivation_dates = inactivation_dates.map {|i| i.nil? || i.strftime("%b %e, %Y")}.join(",")
           
           if last_dosage
           last_inactivation_dates = last_dosage.date.nil? ? "none" : last_dosage.date.strftime("%b %e, %Y")
           last_dosage_titer =  last_dosage.titer.nil? ? "none" : "%.2e" %last_dosage.titer+"vg/ml"
           last_dosage_atcc = last_dosage.titer_atcc.nil? ? "none" : "%.2e" %last_dosage.titer_atcc+"vg/ml"
           last_dosage_to_atcc = last_dosage.titer_to_atcc.nil? ? "none" : "%.2e" %last_dosage.titer_to_atcc+"vg/ml"
           last_inactivation_dates = last_dosage.date.nil? ? "none" : last_dosage.date.strftime("%b %e, %Y")
           block10 ="<strong> #{inactivation_count} </strong> #{inactivation_dates} <br />
                        <strong> Date of the last titration : </strong> #{last_inactivation_dates} <br />
                        <ul>  
                          <li><strong> Titer : </strong> #{last_dosage_titer} </li>
                          <li><strong> Titer ATCC : </strong> #{last_dosage_atcc} </li>
                          <li><strong> Titer to ATCC : </strong> #{last_dosage_to_atcc} </li>
                        </ul>"
           else

               block10 = "<strong>Titer : </strong>None<br />"                
           end

      block11 = "<div>"
      
      block = block1+block2+block3+block4+block5+block6+block7+block8+block9+block10+block11
      
  end
end

#Classe helper para instanciar objetos

class InstanceObject
   class << self
       def instance_object(classe)
           classe = Object.const_get classe
           classe.instance
       end
   end 
end         
class Persona
  def initialize(nombre, edad, correo_electronico, rol)
    @nombre = nombre
    @edad = edad
    @correo_electronico = correo_electronico
    @rol = rol
  end
  
  def to_s
    "Nombre: #{@nombre}, Edad: #{@edad}, Correo: #{@correo_electronico}, Rol: #{@rol} "
  end

  def mostrar_rol
    puts rol
  end

end

pepe = Persona.new("pepe", 2, "holacomoandas","bombero")

puts(pepe)
puts "estoy escribiendo"

def generar_partidos(equipos) #ESTO VA DESPUES PARA GENERAR LOS PARTIDOS
  partidos = []
  n = equipos.length
  (0...n).each do |i|
    ((i + 1)...n).each do |j|
      partidos << [equipos[i], equipos[j]]
    end
  end
  partidos
end
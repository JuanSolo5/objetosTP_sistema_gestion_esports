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


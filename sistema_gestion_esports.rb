class Persona
  def initialize(nombre, edad, correo_electronico)
    @nombre = nombre
    @edad = edad
    @correo_electronico = correo_electronico
    @rol = ""
  end
  
  def to_s
    "Nombre: #{@nombre}, Edad: #{@edad}, Correo: #{@correo_electronico}, Rol: #{@rol} "
  end

  def mostrar_rol
    puts rol
  end

  def mostrar_nombre()
    puts nombre
  end

  def agregarEquipo(equipo)
    equipo.agregarEquipo(self)
  end
end

require 'set'

class Jugador < Persona
  def initialize(nombre, edad, email, rango, jugadores_fav)
    super(nombre, edad, email)
    @rango = rango
    @jugadores_fav = Set.new(jugadores_fav)  # Usamos un Set para asegurar jugadores únicos
    @rol = "Jugador"
  end

  def to_s
    "Nombre: #{@nombre}, Edad: #{@edad}, Email: #{@email}, Rol: #{@rol}, Rango: #{@rango}"
  end

  def get_rango
    @rango
  end

  def set_rango(rango)
    @rango = rango
  end

  def get_nombre
    @nombre
  end

  def get_edad
    @edad
  end

  def get_email
    @email
  end
end









pepe = Persona.new("pepe", 2, "holacomoandas","bombero")

puts(pepe)
puts "estoy escribiendo"


=begin
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
=end



require 'set'

class Persona
  def initialize(nombre, edad, correo_electronico)
    @nombre = nombre
    @edad = edad
    @correo_electronico = correo_electronico
    @rol = ""
  end
  
  def to_s
    "Nombre: #{@nombre}, Edad: #{@edad}, Correo: #{@correo_electronico}, Rol: #{@rol}"
  end

  def mostrar_rol
    puts @rol
  end

  def mostrar_nombre
    puts @nombre
  end

  def agregarEquipo(equipo)
    equipo.agregarPersona(self)
  end
end

class Jugador < Persona
  attr_accessor :rango
  attr_reader :nombre, :edad, :correo_electronico, :rol

  def initialize(nombre, edad, correo_electronico, rango, jugadores_fav)
    super(nombre, edad, correo_electronico)
    @rango = rango
    @jugadores_fav = Set.new(jugadores_fav)
    @rol = "Jugador"
  end

  def to_s
    "Nombre: #{@nombre}, Edad: #{@edad}, Correo: #{@correo_electronico}, Rol: #{@rol}, Rango: #{@rango}"
  end
end

class Entrenador < Persona
  attr_reader :nombre, :edad, :correo_electronico, :rol
  def initialize(nombre, edad, correo_electronico, experiencia)
    super(nombre, edad, correo_electronico)
    @rol = "Entrenador"
    @experiencia = experiencia
  end
  def to_s
    "Nombre: #{@nombre}, Edad: #{@edad}, Correo: #{@correo_electronico}, Rol: #{@rol}, Experiencia: #{@experiencia}"
  end


  def mejorarHabilidades(jugador, equipo)
    datosJugador = equipo.traerDatosJugador(jugador)
    if datosJugador && datosJugador == jugador.to_s
      case jugador.rango
      when "Bronce"
        jugador.rango = "Plata"
      when "Plata"
        jugador.rango = "Oro"
      else
        puts "No existen más niveles"
      end
    end
    puts("Se la mejora fue ralizada: ", jugador)
  end
end

class Equipo
  def initialize(nombreEquipo, logo)
    @nombreEquipo = nombreEquipo
    @logo = logo
    @listaJugadores = []
  end

  def getNombreEquipo
    @nombreEquipo
  end

  def getLogo
    @logo
  end

  def to_s
    "Nombre: #{@nombreEquipo}, Logo: #{@logo}"
  end

  def traerDatosJugador(jugador)
    jugador.to_s
  end

  def agregarPersona(persona)
    @listaJugadores << persona
    puts persona
    puts "#{persona.nombre} se agregó al equipo #{@nombreEquipo} con rol de #{persona.rol}"
    puts "###########################"
  end
end

if __FILE__ == $PROGRAM_NAME
  lista = []
  #JUGADORES
  persona1 = Jugador.new("pepe", 22, "Email1", "Plata", lista)
  persona3 = Jugador.new("Ramon", 27, "Email2", "Bronce", lista)

  #ENTRENADORES
  persona2 = Entrenador.new("Mario", 55, "EmailDT1", 15)


  #EQUIPOS
  equipo1 = Equipo.new("River", "www.logoRiver.com")
  equipo2 = Equipo.new("Boca", "www.logoBoca.com")
  
  
  #ACCIONES
  equipo1.agregarPersona(persona1)
  equipo2.agregarPersona(persona3)
  equipo1.agregarPersona(persona2)
  persona2.mejorarHabilidades(persona1, equipo1) #DT MARIO MEJORA AL PEPE
  
  
end








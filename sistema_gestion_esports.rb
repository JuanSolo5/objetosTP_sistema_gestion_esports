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
    puts "Se va a mejorar el jugador: #{jugador.nombre} del equipo: #{equipo.nombreEquipo} del DT: #{@nombre}"
    datosJugador = equipo.traerDatosJugador(jugador)
    datosDT = equipo.traerDatosDT(self)
    
    if equipo.listaJugadores.include?(jugador) && equipo.listaJugadores.include?(self)
      case jugador.rango
      when "Bronce"
        jugador.rango = "Plata"
      when "Plata"
        jugador.rango = "Oro"
      end
    else
      if(!equipo.listaJugadores.include?(jugador))
        puts "El jugador no juega en este equipo: #{equipo.nombreEquipo}"
      else
        puts("El DT no está asociado al equipo de: #{equipo.nombreEquipo}")
      end
      return
    end
    
    puts ("La mejora fue realizada al jugador: #{jugador.nombre} del equipo: #{equipo.nombreEquipo}")
  end
end

class Equipo
  attr_reader :nombreEquipo, :logo
  attr_accessor :listaJugadores
  
  def initialize(nombreEquipo, logo)
    @nombreEquipo = nombreEquipo
    @logo = logo
    @listaJugadores = []
  end

  def to_s
    "Nombre: #{@nombreEquipo}, Logo: #{@logo}"
  end

  def traerDatosJugador(jugador)
    jugador.to_s
  end

  def traerDatosDT(entrenador)
    entrenador.to_s
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
  # Jugadores
  pepe = Jugador.new("pepe", 22, "Email1", "Plata", lista) # Juega en River
  ramon = Jugador.new("Ramon", 27, "Email2", "Bronce", lista) # Juega en Boca

  # Entrenadores
  marioDT = Entrenador.new("Mario", 55, "EmailDT1", 15) # DT de River
  joseDt = Entrenador.new("Jose", 78, "EmailDt2", 22) # DT de Boca

  # Equipos
  river = Equipo.new("River", "www.logoRiver.com")
  boca = Equipo.new("Boca", "www.logoBoca.com")
  
  # Acciones
  river.agregarPersona(pepe)
  boca.agregarPersona(ramon)
  river.agregarPersona(marioDT)
  boca.agregarPersona(joseDt)
  marioDT.mejorarHabilidades(pepe, river) # DT Mario mejora a Pepe
  joseDt.mejorarHabilidades(ramon, boca)
end

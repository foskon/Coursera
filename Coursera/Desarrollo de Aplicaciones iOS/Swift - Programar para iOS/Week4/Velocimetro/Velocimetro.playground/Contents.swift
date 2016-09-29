
enum Velocidades: Int {
    case Apagado = 0
    case VelocidadBaja = 20
    case VelocidadMedia = 50
    case VelocidadAlta = 120
    
    init(velocidadInicial: Velocidades) {
        self = velocidadInicial
    }
}

class Auto {
    
    var velocidad: Velocidades
    
    init() {
        velocidad = Velocidades(velocidadInicial: .Apagado)
    }
    
    func cambioDeVelocidad() -> (actual: Int, velocidadEnCadena: String) {
        
        var currentText: String
        let currentVelocity: Velocidades = velocidad
        
        switch velocidad {
        
        case .Apagado:
            velocidad = .VelocidadBaja
            currentText = "Apagado"
            break
            
        case .VelocidadBaja:
            velocidad = .VelocidadMedia
            currentText = "Velocidad baja"
            break
            
        case .VelocidadMedia:
            velocidad = .VelocidadAlta
            currentText = "Velocidad media"
            break
        
        case .VelocidadAlta:
            velocidad = .VelocidadMedia
            currentText = "Velocidad alta"
            break
        }
        
        return (currentVelocity.rawValue, currentText)
    }
}

let auto = Auto()


for i in 0 ..< 20 {
    let str = auto.cambioDeVelocidad()
    print("\(str)")
}





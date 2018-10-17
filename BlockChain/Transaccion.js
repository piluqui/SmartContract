class Transaccion{
    
    constructor(nombre, apellido, email, materia, profesor, fecha, hora){
        this.nombre=nombre;
        this.apellido=apellido;
        this.email=email;
        
        this.materia=materia;
        this.profesor=profesor;

        this.fecha=fecha;
        this.hora=hora;
    }
}
module.exports=Transaccion;
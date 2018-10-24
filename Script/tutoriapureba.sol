pragma solidity ^0.4.7;
pragma experimental ABIEncoderV2;
contract Tutoria {
    
    mapping (uint => TutoriaData)  Tutorias;
    
    
    struct TutoriaData {
        string materia;
        address idProfesor;
        address alumno;
        uint confirmado;
        uint cancelado;
        uint fecha;
        uint index;
    }
    
    TutoriaData[] public tuto;
    TutoriaData[] public tutoCalculo;
    
    event Mostrar(TutoriaData);
    
    uint indice = 0;
    function solicitar(string mater, address idProf) public returns (uint){
        require(msg.sender != idProf);
        uint indiceAux = indice++;
        TutoriaData t = Tutorias[indiceAux];
        t.materia = mater;
        t.idProfesor = idProf;
        t.alumno = msg.sender;
        t.confirmado = 0;
        t.cancelado = 0;
        t.fecha = block.timestamp;
        t.index = indiceAux;
        tuto.push(t);
        return indiceAux;
    }
     function getFecha(uint key) public{
        for (uint i=0; i<indice; i++){
          
          if (tuto[i].fecha == key){
              Mostrar(tuto[i]);
          }
                
        }
    }
     function getIndex(uint key) public{
        for (uint i=0; i<indice; i++){
          
          if (tuto[i].index == key){
              Mostrar(tuto[i]);
          }
                
        }
        
    }
     function getMateria(string key) public{
        for (uint i=0; i<indice; i++){
          
          if (keccak256(tuto[i].materia) == keccak256(key)){
              Mostrar(tuto[i]);
          }
                
        }
    }
    
    function getIdProfesor(address key) public view returns (address) {
        for (uint i=0; i<indice; i++){
          
          if (tuto[i].idProfesor == key){
            Mostrar(tuto[i]);  
            }
        }
    }
    
    function getAlumno(address key) public returns (TutoriaData){
        for (uint i=0; i<indice; i++){
          
          if (tuto[i].alumno == key){
            Mostrar(tuto[i]);
            return tuto[i];  
            }
        }
    }
    
    /*function confirmar(address key) public returns (uint) {
        require(Tutorias[key].idProfesor == msg.sender);
        require(Tutorias[key].confirmado == 0);
        require(Tutorias[key].cancelado == 0);
        return Tutorias[key].confirmado = 1;
    }
    
    function cancelar(address key) public {
         require(Tutorias[key].alumno == msg.sender);
        require(Tutorias[key].confirmado == 0);
        require(Tutorias[key].cancelado == 0);
        Tutorias[key].cancelado=1;
    }
    
    function estaConfirmado(address key) public view returns (uint){
        return Tutorias[key].confirmado;   
    }
    
    function estaCancelado(address key) public view returns (uint){
        return Tutorias[key].cancelado;
    }
    */
    
} 
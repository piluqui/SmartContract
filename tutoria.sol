pragma solidity ^0.4.7;
contract Tutoria {
    
    string materia;
    address idProfesor;
    address alumno;
    
    constructor (string mater, address idProf) public{
        materia = mater;
        idProfesor = idProf;
        require (idProf != msg.sender);
        alumno = msg.sender;
    }
    
    function getMateria() public returns (string) {
        return materia;
    }
    
    function getIdProfesor() public view returns (address) {
        return idProfesor;
    }
    
    function getAlumno() public view returns (address) {
        return alumno;
    }
    
    function confirmar() public returns (uint) {
        return 0;
    }
    
    function cancelar() public returns (address) {
        
    }
    
    function esConfirmado() public returns (address) {
        
    }
    
    function estaConfirmado() public returns (address){
    
    }
    
}
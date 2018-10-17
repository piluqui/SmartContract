pragma solidity ^0.4.7;
contract Tutoria {

    struct tutoriaData{
        string materia;
        address idProfesor;
        address alumno;
        uint confirmado;
        uint cancelado;
        bytes32 hash;


    }

    tutoriaData[] public tuto;

    mapping (address => tutoriaData) tutorias;
    function solicitar (string _materia, address _idProfesor) public{

        tutoriaData t = tutorias[msg.sender];
        t.alumno = msg.sender;
        t.materia = _materia;
        t.idProfesor = _idProfesor;
        t.confirmado = 0;
        t.cancelado = 0;
        t.hash = keccak256(t.alumno, t.materia, t.idProfesor, t.confirmado, t.cancelado);
        //tutoriaData.materia = _materia;
        //tutoriaData.idProfesor = _idProfesor;
        require(t.idProfesor != msg.sender);
        //tutoriaData.alumno = msg.sender;
        tuto.push(t);

    }


    function getMateria(address key) public view returns (string) {
        tutoriaData t = tutorias[key];
        return t.materia;
    }

    function getHash(address key) public view returns (bytes32) {
        tutoriaData t = tutorias[key];
        return t.hash;
    }

    function getIdProfesor(address key) public view returns (address) {
        tutoriaData t = tutorias[key];
        return t.idProfesor;
    }

    function getAlumno(address key) public view returns (address) {
        tutoriaData t = tutorias[key];
        return t.alumno;
    }

    function confirmar(address key) public view returns (uint) {
        tutoriaData t = tutorias[key];
        require(msg.sender == t.idProfesor);
        t.confirmado = 1;
        return t.confirmado;
    }

    function cancelar(address key) public view returns (uint) {
        tutoriaData t = tutorias[key];
        require(msg.sender == t.alumno);
        t.cancelado = 1;
        return t.cancelado;
    }

    function estaConfirmado(address key) public view returns (uint) {
        tutoriaData t = tutorias[key];
        return t.confirmado;
    }

    function estaCancelado(address key) public view returns (uint){
        tutoriaData t = tutorias[key];
        return t.cancelado;
    }

}
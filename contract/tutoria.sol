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
    tutoriaData[] public tutoConf;
    tutoriaData[] public tutoCanc;

    mapping (bytes32 => tutoriaData) tutorias;


    function solicitar (string _materia, address _idProfesor) public returns(bytes32){
        require(_idProfesor != msg.sender);
        bytes32 hashAux = keccak256(_materia, _idProfesor);
        tutoriaData t = tutorias[hashAux];
        t.alumno = msg.sender;
        t.materia = _materia;
        t.idProfesor = _idProfesor;
        t.confirmado = 0;
        t.cancelado = 0;
        t.hash = hashAux;
        tuto.push(t);
        return hashAux;
    }


    function getMateria(bytes32 key) public view returns (string) {
        tutoriaData t = tutorias[key];
        return t.materia;
    }

    function getIdProfesor(bytes32 key) public view returns (address) {
        tutoriaData t = tutorias[key];
        return t.idProfesor;
    }

    function getAlumno(bytes32 key) public view returns (address) {
        tutoriaData t = tutorias[key];
        return t.alumno;
    }

    function confirmar(bytes32 key) public{
        tutoriaData t = tutorias[key];
        require(msg.sender == t.idProfesor);
        t.confirmado = 1;
        tutoConf.push(t);
    }

    function cancelar(bytes32 key) public{
        tutoriaData t = tutorias[key];
        require(msg.sender == t.alumno);
        t.cancelado = 1;
        tutoCanc.push(t);
    }

    function estaConfirmado(bytes32 key) public view returns (uint) {
        tutoriaData t = tutorias[key];
        return t.confirmado;
    }

    function estaCancelado(bytes32 key) public view returns (uint){
        tutoriaData t = tutorias[key];
        return t.cancelado;
    }

}

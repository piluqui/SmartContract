pragma solidity ^0.4.7;
contract Tutoria {

    struct tutoriaData{
        string materia;
        address idProfesor;
        address alumno;
        uint confirmado;
        uint cancelado;
        uint256 hash;


    }

    tutoriaData[] public tutoConf;
    tutoriaData[] public tutoCanc;

    mapping (uint256 => tutoriaData) tutorias;

    function solicitar (string _materia, address _idProfesor) public returns(uint256) {
        require(_idProfesor != msg.sender);
        uint256 hashAux = uint256(keccak256(_materia, _idProfesor));
        tutoriaData t = tutorias[hashAux];
        t.alumno = msg.sender;
        t.materia = _materia;
        t.idProfesor = _idProfesor;
        t.confirmado = 0;
        t.cancelado = 0;
        t.hash = hashAux;
        //tuto.push(t);
        return t.hash;
    }


    function getMateria(uint256 key) public view returns (string) {
        tutoriaData t = tutorias[key];
        return t.materia;
    }

    function getHash(uint256 key) public view returns (uint256) {
        tutoriaData t = tutorias[key];
        return t.hash;
    }

    function getIdProfesor(uint256 key) public view returns (address) {
        tutoriaData t = tutorias[key];
        return t.idProfesor;
    }

    function getAlumno(uint256 key) public view returns (address) {
        tutoriaData t = tutorias[key];
        return t.alumno;
    }

    function confirmar(uint256 key) public {
        tutoriaData storage t = tutorias[key];
        require(msg.sender == t.idProfesor);
        t.confirmado = 1;
        tutoConf.push(t);
    }

    function cancelar(uint256 key) public{
        tutoriaData t = tutorias[key];
        require(msg.sender == t.alumno);
        t.cancelado = 1;
        tutoCanc.push(t);
    }

    function estaConfirmado(uint256 key) public view returns (uint) {
        tutoriaData t = tutorias[key];
        return t.confirmado;
    }

    function estaCancelado(uint256 key) public view returns (uint){
        tutoriaData t = tutorias[key];
        return t.cancelado;
    }

}
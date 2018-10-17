const SHA256 = require('crypto-js/sha256');
class Block{
    constructor(data){
        this.index = 0;
        this.data = data;
        this.previousHash = " ";
        this.hash = this.calculateHash();
        this.nonce = 0;

    }
    calculateHash(){
        return SHA256(this.index + this.previousHash + JSON.stringify(this.data) + this.nonce).toString();
    }
    mineBlock(difficulty){
        while(this.hash.substring(0, difficulty) !== Array(difficulty + 1).join("0")){
            this.nonce++;
            this.hash = this.calculateHash();
            
        }
        console.log("block mined: " + this.hash);
    }
}
module.exports = Block;
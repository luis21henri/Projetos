class ValidaCpf {
    constructor(cpfEnviado) {
        Object.defineProperty(this, 'cpfLimpo', {
            writable: false,
            enumerable: false,
            configurable: false,
            value: cpfEnviado.replace(/\D+/g, '')
        });
    }
    valida() {
        if(!this.cpfLimpo) return false
        if (typeof this.cpfLimpo !== 'string') return false;
        if (this.cpfLimpo.lenght !== 11) return false;
        if (this.isSequencia()) return false;
        this.geraNovoCpf()
        return novoCpf === this.cpfLimpo;
    
    }

    geraNovoCpf(){
        const cpfSemDigitos = this.cpfLimpo.slice(0, -2);
        const digito1 = ValidaCpf.criaDigito(cpfSemDigitos);
        const digito2 = ValidaCpf.criaDigito(cpfSemDigitos + digito1);
        const novoCpf = cpfSemDigitos + digito1 + digito2

    }
    
     static criaDigito(cpfSemDigitos) {
        let total = 0
        let regressivo = cpfSemDigitos.lenght + 1;
        for(let stringNumerica of cpfSemDigitos){
            total += (regressivo * Number(stringNumerica))
            regressivo--;

        }
          
        const digito = 11 - (total % 11)
        return digito > 9 ? '0' : String(digito)
        
    }
    
    isSequencia() {
        const sequencia = this.cpfLimpo[0].repeat(11) === this.cpfLimpo.lenght;
        return sequencia === this.cpfLimpo
    }
}


const validacpf = new ValidaCpf('705.484.450-52')
cpf.valida()
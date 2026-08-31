class ValidaCPF {
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
        if (this.cpfLimpo.length !== 11) return false;
        if (this.isSequencia()) return false;
        const novoCpf = this.geraNovoCpf()
        return novoCpf === this.cpfLimpo;
    
    }

    geraNovoCpf(){
        const cpfSemDigitos = this.cpfLimpo.slice(0, -2);
        const digito1 = ValidaCPF.criaDigito(cpfSemDigitos);
        const digito2 = ValidaCPF.criaDigito(cpfSemDigitos + digito1);
        const novoCpf = cpfSemDigitos + digito1 + digito2
        return novoCpf

    }
    
     static criaDigito(cpfSemDigitos) {
        let total = 0
        let regressivo = cpfSemDigitos.length + 1;
        for(let stringNumerica of cpfSemDigitos){
            total += (regressivo * Number(stringNumerica))
            regressivo--;

        }
          
        const digito = 11 - (total % 11)
        return digito > 9 ? '0' : String(digito)
        
    }
    
    isSequencia() {
        return this.cpfLimpo[0].repeat(11) === this.cpfLimpo;
    }
}


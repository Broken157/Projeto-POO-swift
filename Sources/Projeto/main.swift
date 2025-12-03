import Foundation

enum NivelAluno{
    case iniciante 
    case intermediario
    case avancado
}

class Pessoa{
    var nome: String
    var email: String
    
    init(nome: String, email: String){
        self.nome = nome
        self.email = email
    }
    
    func getDescricao() -> String{
        return """
        Informações Pessoais:
        Nome: \(self.nome)
        Email: \(self.email)
        """
    }
}

class Plano{
    var nome: String

    init(nome: String){
        self.nome = nome
    }

    func calcularMensalidade() -> Double{
        return 0.0
    }
}

class PlanoMensal: Plano{
    init(){
        super.init(nome: "Plano Mensal")
    }

    override func calcularMensalidade() -> Double {
        return 120.0
    }
}

class Instrutor: Pessoa{
    let especialidade: String
    
    init(nome: String, email: String, especialidade: String){
        self.especialidade = especialidade
        super.init(nome: nome, email: email)
    }
    
    override func getDescricao() -> String{
        return """
        descricao:
        Nome: \(nome)
        Email: \(email)
        Especialidade: \(self.especialidade)
        """
    }
}

class Aluno: Pessoa{
    let matricula: String
    var nivel: NivelAluno
    private(set) var plano: Plano
    
    init(nome: String, email: String, matricula: String,nivel: NivelAluno, plano: Plano){
        self.matricula = matricula
        self.plano = plano
        self.nivel = nivel
        super.init(nome: nome, email: email)
    }
}

class PlanoAnual: Plano{
    init(){
        super.init (nome: "Plano Anual(Promocional)")
    }
    override func calcularMensalidade( ) -> Double{
        let mensalidade: Double = (120*0.80)
        return mensalidade
    }
}

class Aula{
    var nome: String
    var instrutor: Instrutor
    
    init(nome: String, instrutor: Instrutor){
        self.nome = nome
        self.instrutor = instrutor
    }
    
     func getDescricao() -> String{
        return """
        Descricao: 
        Aula: \(self.nome)
        Instrutor: \(self.instrutor)
        """
    }
}

class AulaPersonal: Aula{
    var aluno: Aluno
    
    init(nome: String, instrutor: Instrutor, aluno: Aluno){
        self.aluno = aluno
        super.init(nome: nome, instrutor: instrutor)
    }
    
    override func getDescricao() -> String{
       return """
        Descricao: 
        Aluno: \(self.aluno)
        Aula Matriculada: \(nome)
        Instrutor: \(instrutor)
        """ 
    }
}

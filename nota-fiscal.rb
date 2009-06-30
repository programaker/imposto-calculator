require 'date'

class Date
    def to_s
        strftime('%d/%m/%Y')
    end
end


class Currency
private
    def round(value)
        x = 2
        (value * 10**x).round.to_f / 10**x
    end
public
    def initialize(value)
        @value = round(value)
    end
    
    attr_reader :value
    
    def to_s
        "%0.2f" % @value
    end
    
    def +(other)
        Currency.new(@value + other.value)
    end
    
    def -(other)
        Currency.new(@value - other.value)
    end
end


class Firma
    attr_reader :nome, :endereco, :municipio, :estado, :cep, :cnpj, :inscricao_municipal_estadual

    def initialize(nome, endereco, municipio, estado, cep, cnpj, inscricao_municipal_estadual)
        @nome, @endereco, @municipio, @estado, @cep, @cnpj, @inscricao_municipal_estadual = 
            nome, endereco, municipio, estado, cep, cnpj, inscricao_municipal_estadual
    end
    
    def self.ideais
        self.new(
            'Ideais Tecnologia Ltda', 
            'rua da Assembléia 98, 9º andar, centro',
            'Rio de Janeiro', 'RJ', '20011-000',
            '03.789.968/0001-37', '277.040-7'
        )
    end
end


class NotaFiscal
    def initialize(total, firma)
        @total, @firma = total, firma
    end
    
    def codigo_fiscal
        106
    end
    
    def natureza_servicos
        'serviços'
    end
    
    def data_emissao
        Date.today   
    end
    
    attr_reader :firma
    
    def discriminacao_servicos
        'prestação de serviços de TI'
    end
    
    def acima_limite?
        @total > 5000
    end
    
    def total
        Currency.new(@total)
    end
    
    def irrf
        Currency.new(@total * 1.5 / 100)
    end
    
    def iss
        Currency.new(@total * 5 / 100)
    end
    
    def pis_cofins_csocial
        Currency.new(
            if acima_limite?
                @total * 4.65 / 100
            else
                0.0
            end
        )
    end
    
    def total_impostos
        irrf + iss + pis_cofins_csocial
    end
    
    def valor_liquido
        total - total_impostos
    end
end

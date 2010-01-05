#! /usr/bin/ruby

require 'nota-fiscal'
require 'firma-default'

firma = FIRMAS[ARGV[1]] || FIRMA_DEFAULT
nota_fiscal = NotaFiscal.new(ARGV[0].to_f, firma)

puts
puts "----- NOTA FISCAL -----"
puts "código fiscal = #{nota_fiscal.codigo_fiscal}"
puts "natureza dos serviços = #{nota_fiscal.natureza_servicos}"
puts "data da emissão = #{nota_fiscal.data_emissao}"

puts
puts "----- USUÁRIO DOS SERVIÇOS -----"
puts "firma/nome = #{nota_fiscal.firma.nome}"
puts "endereço = #{nota_fiscal.firma.endereco}"
puts "municipio = #{nota_fiscal.firma.municipio}\t\testado = #{nota_fiscal.firma.estado}\t\tCEP = #{nota_fiscal.firma.cep}"
puts "CNPJ = #{nota_fiscal.firma.cnpj}\t\tinsc. mun. e/ou estadual = #{nota_fiscal.firma.inscricao_municipal_estadual}"

puts
puts "----- DISCRIMINAÇÃO DOS SERVIÇOS -----"
puts "#{nota_fiscal.discriminacao_servicos}\t\ttotal = #{nota_fiscal.total}"
puts

if nota_fiscal.acima_limite?
    puts "conforme a lei nº 10.833 de 29/12/2003"
    puts "(DOU 30/12/2003) arts. 29, 30 E 31"
    puts "\"retenção\" DE 4,65% (PIS 0,65%,"
    puts "COFINS 3%, c. social 1%) = #{nota_fiscal.pis_cofins_csocial}"
    puts
end

puts "IRRF 1,5% = #{nota_fiscal.irrf}"
puts "ret. ISS 5% = #{nota_fiscal.iss}"
puts
puts "valor dos serviços = #{nota_fiscal.total}"
puts "valor total da nota = #{nota_fiscal.total}"
puts
puts "# total de impostos = #{nota_fiscal.total_impostos}"
puts "# valor liquido = #{nota_fiscal.valor_liquido}"
puts

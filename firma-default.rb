require 'nota-fiscal'

ideais = Firma.new(
    'Ideais Tecnologia Ltda', 
    'rua da Assembléia 98, 9º andar, centro',
    'Rio de Janeiro', 'RJ', '20011-000',
    '03.789.968/0001-37', '277.040-7'
)

triscal = Firma.new(
    'CFP3 Consultoria e Tecnologia Ltda', 
    'tv do Ouvidor 5, 9º andar, centro',
    'Rio de Janeiro', 'RJ', '20040-040',
    '68.555.473/0001-99', '010.097-37'
)

FIRMA_DEFAULT = ideais
FIRMAS = {"ideais" => ideais, "triscal" => triscal}

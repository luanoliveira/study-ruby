require "json"
require_relative "database"


class Cnae < ActiveRecord::Base
    self.table_name = "cnaes"
end

file = File.read "./files/subclasses.json"
data = JSON.parse(file)

data.each do |row|
    if Cnae.find_by(code: row["id"]).present?
        next
    end

    cnae = Cnae.new(
        code: row["id"], 
        title: row["descricao"], 
        activities: row["atividades"].join("\n"), 
        description: row["observacoes"].join("\n")
    )

    puts cnae.save!
    puts cnae.inspect
=begin
    
    puts "code => #{row["id"]}"
    puts "title => #{row["descricao"]}"
    puts "activities => #{row["atividades"].join("\n")}"
    puts "description => #{row["observacoes"].join("\n")}"
    puts "--------"
=end
end

=begin
{
    "id":"4929902",
    "descricao":"TRANSPORTE RODOVIÁRIO COLETIVO DE PASSAGEIROS, SOB REGIME DE FRETAMENTO, INTERMUNICIPAL, INTERESTADUAL E INTERNACIONAL","classe": {
        "id":"49299",
        "descricao":"TRANSPORTE RODOVIÁRIO COLETIVO DE PASSAGEIROS, SOB REGIME DE FRETAMENTO, E OUTROS TRANSPORTES RODOVIÁRIOS NÃO ESPECIFICADOS ANTERIORMENTE",
        "grupo": {
            "id":"492",
            "descricao":"TRANSPORTE RODOVIÁRIO DE PASSAGEIROS",
            "divisao": {
                "id":"49",
                "descricao":"TRANSPORTE TERRESTRE",
                "secao":{
                    "id":"H",
                    "descricao":"TRANSPORTE, ARMAZENAGEM E CORREIO"
                }
            }
        },
        "observacoes":[
            "Esta classe compreende - o transporte rodoviário coletivo de passageiros, sob o regime de fretamento\r\n- a organização de excursões em veículos rodoviários próprios\r\n- o transporte de empregados para terceiros\r\n- outros transportes rodoviários de passageiros, sem itinerário fixo, não especificados anteriormente","Esta classe NÃO compreende - os serviços de ambulâncias (86.22-4)\r\n- o transporte escolar (49.24-8)\r\n- a locação de automóveis com motorista ou condutor (49.23-0)\r\n- a locação de automóveis sem motorista ou condutor (77.11-0)\r\n- o transporte turístico em veículos de tração animal (93.29-8)"
        ]
    },
    "atividades":[
        "VEÍCULOS RODOVIÁRIOS DE PASSAGEIROS COM MOTORISTA, INTERESTADUAL; LOCAÇÃO DE"
    ],
    "observacoes":[
        "Esta subclasse compreende - o transporte rodoviário coletivo de passageiros, sob regime de fretamento no âmbito intermunicipal, fora da região metropolitana, interestadual e internacional",
        "Esta subclasse NÃO compreende - a locação de automóveis com motorista ou condutor (4923-0/02)\r\n- o transporte especializado na locomoção de estudantes da rede pública ou privada (4924-8/00)\r\n- a locação de automóveis sem motorista ou condutor (7711-0/00)"
    ]
}
=end
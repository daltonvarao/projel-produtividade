import Factory from '@ioc:Adonis/Lucid/Factory'
import { DateTime } from 'luxon'

import User from 'App/Models/User'
import Cargo from 'App/Models/Cargo'
import Atividade from 'App/Models/Atividade'
import ApiSyncVersion from 'App/Models/ApiSyncVersion'
import Equipamento from 'App/Models/Equipamento'
import Contrato from 'App/Models/Contrato'
import Rdo from 'App/Models/Rdo'
import AtividadeRdo from 'App/Models/AtividadeRdo'
import Complexo from 'App/Models/Complexo'
import Mina from 'App/Models/Mina'
import Estrutura from 'App/Models/Estrutura'
import Furo from 'App/Models/Furo'

export const CargoFactory = Factory.define(Cargo, ({ faker }) => {
  return {
    titulo: faker.name.jobTitle(),
  }
})
  .relation('users', () => UserFactory)
  .build()

export const UserFactory = Factory.define(User, ({ faker }) => {
  return {
    password: '123456',
    cpf: faker.random.alphaNumeric(),
    nome: faker.name.firstName(),
    agencia: '102-0',
    banco: 'Banco do Brasil',
    conta: '746247-1',
    operacao_caixa: '013',
  }
})
  .relation('contrato', () => ContratoFactory)
  .relation('cargo', () => CargoFactory)
  .build()

export const ContratoFactory = Factory.define(Contrato, ({ faker }) => {
  return {
    centroCusto: faker.datatype.number(9999),
    descricao: faker.random.words(20),
    numero: faker.random.alphaNumeric(10),
  }
})
  .relation('cargos', () => CargoFactory)
  .relation('atividades', () => AtividadeFactory)
  .relation('equipamentos', () => EquipamentoFactory)
  .build()

export const AtividadeFactory = Factory.define(Atividade, ({ faker }) => {
  return {
    descricao: faker.name.jobDescriptor(),
    tipo: faker.helpers.randomize(['parada', 'improdutiva', 'produtiva']),
    unidadeMedida: faker.helpers.randomize(['metros', 'unidades']),
  }
}).build()

export const ApiSyncVersionFactory = Factory.define(ApiSyncVersion, ({ faker }) => {
  return {
    requestUrl: faker.internet.url(),
    requestMethod: ['POST', 'PUT', 'DELETE'][faker.datatype.number(2)],
  }
}).build()

export const EquipamentoFactory = Factory.define(Equipamento, ({ faker }) => {
  return {
    descricao: faker.commerce.productDescription(),
    tag: faker.commerce.productName(),
    sonda: faker.datatype.boolean(),
  }
}).build()

export const RdoFactory = Factory.define(Rdo, ({ faker }) => {
  return {
    condicoesTempo: faker.helpers.randomize(['bom', 'chuvoso']),
    status: faker.helpers.randomize(['andamento', 'finalizado']),
    data: DateTime.local(),
    nome: faker.helpers.randomize([
      'Sondagem',
      'Sondagem Mista',
      'Limpeza',
      'Ensaio',
      'Deslocamento',
    ]),
    pluviometria: faker.datatype.float(100),
  }
})
  .relation('rdoAtividades', () => AtividadeRdoFactory)
  .relation('equipamentoPrincipal', () => EquipamentoFactory)
  .build()

export const AtividadeRdoFactory = Factory.define(AtividadeRdo, ({ faker }) => ({
  horaFim: DateTime.local(),
  horaInicio: DateTime.local(),
  quantidade: faker.datatype.float(50),
  quantidadeFinal: faker.datatype.float(50),
  quantidadeInicial: faker.datatype.float(50),
}))
  .relation('atividade', () => AtividadeFactory)
  .relation('rdo', () => RdoFactory)
  .relation('furo', () => FuroFactory)
  .build()

export const ComplexoFactory = Factory.define(Complexo, ({ faker }) => ({
  nome: faker.address.country(),
}))
  .relation('minas', () => MinaFactory)
  .build()

export const MinaFactory = Factory.define(Mina, ({ faker }) => ({
  nome: faker.address.city(),
}))
  .relation('complexo', () => ComplexoFactory)
  .relation('estruturas', () => EstruturaFactory)
  .build()

export const EstruturaFactory = Factory.define(Estrutura, ({ faker }) => ({
  nome: faker.address.city(),
}))
  .relation('mina', () => MinaFactory)
  .relation('furos', () => FuroFactory)
  .build()

export const FuroFactory = Factory.define(Furo, ({ faker }) => ({
  nome: faker.address.city(),
}))
  .relation('estrutura', () => EstruturaFactory)
  .relation('rdoAtividades', () => AtividadeFactory)
  .build()

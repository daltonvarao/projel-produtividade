import BaseSeeder from '@ioc:Adonis/Lucid/Seeder'
import { CargoFactory, ComplexoFactory, ContratoFactory } from 'Database/factories'

export default class AdminSeeder extends BaseSeeder {
  public async run() {
    const contrato = await ContratoFactory.merge({
      centroCusto: 227,
      descricao: 'Projel MG',
      numero: '11984/2021',
    })
      .with('atividades', 3, (atividadeFactory) => {
        atividadeFactory.merge([
          {
            descricao: 'Sondagem - Destrutiva - Solo',
            unidadeMedida: 'metros',
            tipo: 'produtiva',
          },
          {
            descricao: 'Sondagem - Destrutiva - Rocha',
            unidadeMedida: 'metros',
            tipo: 'produtiva',
          },
          {
            descricao: 'Ensaio de infiltração',
            unidadeMedida: 'unidades',
            tipo: 'produtiva',
          },
          {
            descricao: 'Almoço',
            tipo: 'improdutiva',
          },
        ])
      })
      .with('equipamentos', 4, (equipamentoFactory) => {
        equipamentoFactory.merge([
          {
            descricao: 'Caminhonete',
            tag: 'PJL-28',
            sonda: false,
          },
          {
            descricao: 'Sondeq',
            tag: 'PJL-47',
            sonda: true,
          },
          {
            descricao: 'Sonda Mach 700',
            tag: 'PJL-66',
            sonda: true,
          },
          {
            descricao: 'Caminhão Pipa',
            tag: 'PJL-85',
            sonda: false,
          },
        ])
      })
      .create()

    await CargoFactory.merge({ titulo: 'Admin', contratoId: contrato.id })
      .with('users', 3, (UserFactory) => {
        UserFactory.merge([
          {
            cpf: '03935644280',
            nome: 'Dalton Felipe',
            password: '123456',
            contratoId: contrato.id,
          },
          {
            cpf: '03935644281',
            nome: 'Jane Doe',
            password: '123456',
            contratoId: contrato.id,
          },
          {
            cpf: '03935644282',
            nome: 'John Doe',
            password: '123456',
            contratoId: contrato.id,
          },
        ])
      })
      .create()

    await ComplexoFactory.merge({ nome: 'Mariana', contratoId: contrato.id })
      .with('minas', 1, (minas) => {
        minas
          .merge({
            nome: 'Fazendão',
            contratoId: contrato.id,
          })
          .with('estruturas', 1, (estruturas) => {
            estruturas
              .merge({
                nome: 'Barragem Pacatu',
                contratoId: contrato.id,
              })
              .with('furos', 1, (furos) => {
                furos.merge({
                  nome: 'PZ-IC-09',
                  contratoId: contrato.id,
                })
              })
          })
      })
      .create()

    await ComplexoFactory.merge({ nome: 'Carajás', contratoId: contrato.id })
      .with('minas', 1, (minas) => {
        minas
          .merge({
            nome: 'Serra Norte',
            contratoId: contrato.id,
          })
          .with('estruturas', 1, (estruturas) => {
            estruturas
              .merge({
                nome: 'Barragem Jacaré',
                contratoId: contrato.id,
              })
              .with('furos', 1, (furos) => {
                furos.merge({
                  nome: 'PZ-IC-11',
                  contratoId: contrato.id,
                })
              })
          })
      })
      .create()
  }
}

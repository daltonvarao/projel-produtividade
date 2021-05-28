const routes = [
  {
    name: 'admin.areas',
    title: 'Áreas',
    actions: [true, true, true, true],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.atividades',
    title: 'Atividades',
    actions: [true, true, true, true],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.cargos',
    title: 'Cargos',
    actions: [true, true, true, true],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.complexos',
    title: 'Complexos',
    actions: [true, true, true, true],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.configuracoes',
    title: 'Configurações',
    actions: [false, true, true, false],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.contratos',
    title: 'Contratos',
    actions: [true, true, true, true],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.dashboard',
    title: 'Dashboard',
    actions: [false, true, false, false],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.equipamentos',
    title: 'Equipamentos',
    actions: [true, true, true, true],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.estruturas',
    title: 'Estruturas',
    actions: [true, true, true, true],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.furos',
    title: 'Furos',
    actions: [true, true, true, true],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.users',
    title: 'Funcionários',
    actions: [true, true, true, true],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.configuracoes.logs',
    title: 'Logs do sistema',
    actions: [true, false, false, false],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.minas',
    title: 'Minas',
    actions: [true, true, true, true],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.rdos',
    title: 'Rdos',
    actions: [false, true, false, true],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.reports.atividades_usuarios',
    title: 'Relatório Atividades Funcionários',
    actions: [false, true, false, false],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
  {
    name: 'admin.reports.producao_usuarios',
    title: 'Relatório Produção Funcionários',
    actions: [false, true, false, false],
    actionsTitle: ['Criar', 'Ler', 'Atualizar', 'Deletar'],
  },
]

export default routes

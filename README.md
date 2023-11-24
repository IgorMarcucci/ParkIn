# ParkIn

# Requisitos do aplicativo

**Requisitos Funcionais:**

**RF01 - Autenticação de Funcionários:** Deve ser possível para os colaboradores acessarem o aplicativo inserindo seu endereço de e-mail juntamente com sua senha.

**RF02 - Cadastro de Funcionários:** O cadastro no sistema deve estar disponível para os novos funcionários informarem seu CPF, endereço de e-mail e senha.

**RF03 - Adição Manual de Veículo:** No menu principal do funcionário, é importante que haja uma opção para adicionar veículos às vagas de estacionamento manualmente. Essa função pedirá os dados da placa, marca e modelo.

**RF04 - Remoção de Veículo:** Através da tela principal, é viável para os colaboradores realizar a retirada dos automóveis no estacionamento ao deslizarem na região delimitada para cada carro selecionado.

**RF05 - Lista de Vagas em Tempo Real:** A lista dos veículos presentes no estacionamento precisa ser mostrada ao vivo na tela inicial do funcionário.

**RF06 - Alteração do Número de Vagas:** É fundamental que a tela principal possua um recurso que permita alterar o número de vagas registradas para o estacionamento.

**RF07 - Histórico de Veículos:** Deve ser possível para os funcionários acessarem uma página com o registro completo dos veículos, apresentando dados detalhados sobre todos aqueles que já frequentaram o estacionamento.

**RF08 - Relatórios de Receita e Quantidade de Veículos:** Para obter dados sobre a receita arrecadada e o volume de tráfego no estacionamento, é necessário acessar uma tela específica dentro do sistema. Essas informações referem-se aos períodos dos últimos 7 e 30 dias.

**RF09 - Visualização de Estacionamentos para Clientes:** Na tela do cliente é necessário apresentar todos os estacionamentos que estão cadastrados no aplicativo. Deve ser informado o nome, endereço e a quantidade atualizada de vagas em tempo real.

**RF10 - Rota para Estacionamento:** No display do cliente, é necessário que os usuários tenham a opção de traçar um caminho desde onde estão até o estacionamento de interesse.

**Requisitos Não Funcionais:**

**RNF01 - Desempenho em Tempo Real:** É possível acompanhar facilmente as vagas livres e os veículos disponíveis em tempo real, o que torna todo o processo altamente eficiente e com pouca latência.

**RNF02 - Usabilidade Intuitiva:** Para proporcionar uma experiência simplificada tanto aos funcionários quanto aos clientes durante o uso, é essencial contar com um design de tela intuitivo.

**RNF03 - Escalabilidade do Banco de Dados:** Garantir a capacidade de crescimento do sistema requer uma configuração adequada no Firebase Firestore ao lidar com um alto volume de dados.

**RNF04 - Compatibilidade com Dispositivos Móveis:** O aplicativo deve ter um design responsivo e funcionar bem em diversos dispositivos móveis.

**RNF05 - Backup e Recuperação de Dados:** Para garantir a possibilidade de recuperar os dados em cenários desafiadores, é imprescindível definir e realizar periodicamente as práticas corretas necessárias, como efetuar backups.

**RNF06 - Sincronização Offline:** Mesmo sem acesso à internet, existe viabilidade em executar as funções fundamentais do aplicativo. Ao restabelecer a conexão com a rede, ocorrerá uma sincronização automática dos dados.

**RNF07 - Privacidade dos Dados:** O Firebase garante a privacidade e segurança das informações pessoais armazenadas ao seguir todas as regulamentações relacionadas com a proteção de dados.

**RNF08 - Documentação do Sistema:** Ter acesso a uma documentação precisa é fundamental tanto para os desenvolvedores quanto para os administradores do sistema.

**RNF09 - Manutenibilidade do Código:** Uma forma crucial de facilitar as próximas atualizações do aplicativo é ter uma codificação modular e criar um documento abrangente.

# Prototipação do aplicativo

**FIGMA:** <https://www.figma.com/file/ELxrrwHuzMQo56W5xSVEIO/Parkin?type=design&node-id=0%3A1&mode=design&t=mzDiIAe9U0U40sal-1>

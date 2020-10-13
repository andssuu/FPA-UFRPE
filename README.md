# FPA-UFRPE

## Resumo do aplicativo

O aplicativo consistirá em uma ferramenta de alto nível para o monitoramento do gado leiteiro. Exibirá informações 
relativas ao comportamento dos animais com o objetivo de ajudar o produtor numa melhor tomada de decisão. Comportamentos
como andando, ócio, pastando e ruminando são interessantes para otimização de recursos no manejo dos animais. Dentre tais
informações de comportamento, é possível destacar a ruminação do animal na detecção de doenças e no cio.

Além disso, será possível visualizar e identificar por meio de um mapa, em tempo real, qual e onde cada animal está. O 
aplicativo conterá um sistema de alertas que notificará ao produtor eventos de interesse. Os dados serão obtidos por meio 
de um dispositivo embutido em uma coleira colocada no pescoço do animal capturando dados dos movimentos (acelerômetro) e a 
localização (GPS).

Esses dados serão enviados por meio de um sistema telemétrico, processados e armazenados em um servidor. 
Na etapa de processamento dos dados, será executada uma heurística que implementa a classificação dos comportamentos 
mediante a utilização de algoritmos de *machine learning*. Tal servidor será o responsável pela alimentação das informações
ao aplicativo. O usuário poderá adicionar e excluir os animais que assim o desejar mediante uma autenticação feita no servidor.

## Requisitos do aplicativo

1. Cadastro de animais;
2. Visualização dos dados de um animal cadastrado;
3. Utilização de mapa para visualizar a localização do animal;
4. Gráficos para visualização dos dados;
5. Alertas de eventos do cio;
6. Armazenamento local;
7. Login

## Interface do Usuário

### Lista de widgets utilizados<sup id="a1">[1](#f1)</sup>

Basic widgets                                                            | Layout widgets               | Material Components | Advanced UI 
-------------------------------------------------------------------------| -----------------------------|---------------------|------------| 
[AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html) | [Center](https://api.flutter.dev/flutter/widgets/Center-class.html) | [Drawer](https://api.flutter.dev/flutter/material/Drawer-class.html) | [SplashScreen](https://flutter.dev/docs/development/ui/advanced/splash-screen)
[Column](https://api.flutter.dev/flutter/widgets/Column-class.html)      | [Expanded](https://api.flutter.dev/flutter/widgets/Expanded-class.html) | [SimpleDialog](https://api.flutter.dev/flutter/material/SimpleDialog-class.html) |
[Container](https://api.flutter.dev/flutter/widgets/Container-class.html)| [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html) |  |  |
[Icon](https://api.flutter.dev/flutter/widgets/Icon-class.html)          |                                                                         |  |  |
[Image](https://api.flutter.dev/flutter/widgets/Image-class.html)        |                                                                         |  |  |
[Row](https://api.flutter.dev/flutter/widgets/Row-class.html)            |                                                                         |  |  |
[Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) |                                                                         |  |  |
[Text](https://api.flutter.dev/flutter/widgets/Text-class.html)          |                                                                         |  |  |

### Fluxograma de Telas

<img src="https://github.com/andssuu/FPA-UFRPE/blob/master/moncattle/assets/images/fluxograma_telas.svg">

### Tela Login

##### Descrição

Tela para o usuário fazer o login no aplicativo. O cadastro do usuário será realizado previamente, assim como os aplicativos<sup id="a2">[2](#f2)</sup> comerciais fazem. Para ambiente de teste e validação da ideia foi criado um usuário ```ufrpe``` com senha ```ufrpe```.

#### Diagrama de Widgets

<img src="https://github.com/andssuu/FPA-UFRPE/blob/master/moncattle/assets/images/diagrams/diagram_login.svg">

#### Tela Dashboard

##### Descrição

É a tela principal do aplicativo. Por meio dela, pode-se chegar em qualquer outra tela.

#### Diagrama de Widgets

<img src="https://github.com/andssuu/FPA-UFRPE/blob/master/moncattle/assets/images/diagrams/diagram_dashboard.svg">

#### Tela Animais

##### Descrição

Tela responsável pela listagem dos animais cadastrados. Por meio dela, podemos chegar a tela de cadastro de um animal ou
a tela que exibe os dados de um animal cadastrado. Também é possível remover um animal cadastrado apenas arrastado o nome
do animal na lista para a esquerda ou direita. A figura abaixo ilustra esse processo de remoção de um animal.

<img src="https://github.com/andssuu/FPA-UFRPE/blob/master/moncattle/assets/images/screens/remove_animal.png">

#### Diagrama de Widgets

<img src="https://github.com/andssuu/FPA-UFRPE/blob/master/moncattle/assets/images/diagrams/diagram_list_animals.svg">

#### Tela Novo Animal

##### Descrição

Tela contendo um formulário para o cadastro de um animal. O campo ```ID Coleira``` será o responsável pela integração
do sensor com o animal cadastrado. Depois dessa integração, o sensor irá enviar os dados tais como: coordenadas da 
localização, comportamento e alertas.

#### Diagrama de Widgets

<img src="https://github.com/andssuu/FPA-UFRPE/blob/master/moncattle/assets/images/diagrams/diagram_add_animal.svg">

#### Tela Detalhes

##### Descrição

Tela para exibir os dados de um animal cadastrado.

#### Diagrama de Widgets

<img src="https://github.com/andssuu/FPA-UFRPE/blob/master/moncattle/assets/images/diagrams/diagram_detail_animal.svg">

#### Tela Mapa

##### Descrição

Tela contém um mapa para mostrar a localização dos animais por meio de marcadores. É possivel visualizar individualmente
os dados de cada marcador apenas clicando nele. Serão exibidos os dados de ```Nome``` e ```Id Coleira```.

#### Diagrama de Widgets

<img src="https://github.com/andssuu/FPA-UFRPE/blob/master/moncattle/assets/images/diagrams/diagram_map.svg">

#### Tela Gráficos

##### Descrição

Tela exibe alguns gráficos para visualizaço dos dados, tais como:

  - Histórico de animais cadastrados: quantidade de animais cadastrados por dia 
  - Quantidade de animais por raça: quantitativo de animais por cada uma das 4 raças (Holandesa, Girolando, Jersey e Gir)

#### Diagrama de Widgets

<img src="https://github.com/andssuu/FPA-UFRPE/blob/master/moncattle/assets/images/diagrams/diagram_graphics.svg">

#### Tela Alertas

##### ```TODO```
  - [X] ```Listagem dinâmica dos alertas```
  - [X] ```Remoção dos alertas```
  - [X] ```Ajuste do alinhamento para cada alerta```
  - [X] ```Notificação (push) quando o usuário estiver com o app em execução```
  - [X] ```Notificação (push) em background```

##### Descrição

Tela responsável pela listagem dos alertas de cio dos animais. A identificação do cio é realizada por meio de um algoritmo
de aprendizagem de máquina e então enviado como alerta para o aplicativo.

Após a identificação do comportamento, é enviada uma notificação para o aplicativo informando que o animal começou a entrar 
no período do cio. Esse alerta é armazenado e exibido na lista de alertas. O usuário pode excluir os alertas apenas arrastando
o alerta para algum dos lados (semelhante a exclusão de um animal).

#### Diagrama de Widgets

<img src="https://github.com/andssuu/FPA-UFRPE/blob/master/moncattle/assets/images/diagrams/diagram_alerts.svg">

#### Tela Sobre

##### Descrição

Tela contendo as informações sobre o contexto do desenvolvimento do aplicativo.

#### Diagrama de Widgets

<img src="https://github.com/andssuu/FPA-UFRPE/blob/master/moncattle/assets/images/diagrams/diagram_about.svg">


<sub id="f1">1</sub> Lista de widgets que possivelmente serão utilizados.[↩](#a1)

<sub id="f2">2</sub> Lista de aplicativos comerciais encontrados:[↩](#a2)
  - [CowManager](https://play.google.com/store/apps/details?id=nl.agis.android.cowmanager&hl=en)
  - [CattleManager](https://play.google.com/store/apps/details?id=com.catman&hl=en)
  - [CowMaster](https://play.google.com/store/apps/details?id=com.kelimesoft.suruyonetimi&hl=ro)
  - [LivestockManager](https://play.google.com/store/apps/details?id=com.cabral.livestockmanager&hl=ro)
  - [Moocall](https://play.google.com/store/apps/details?id=com.moocall.moocall&hl=ro)
  - [VacApp](https://play.google.com/store/apps/details?id=com.mateuyabar.vacapp&hl=ro)
  - [Afi2Gopro](https://play.google.com/store/apps/details?id=com.afimilk.afi2gopro&hl=ro)

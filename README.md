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

1. Utilização de mapa para visualizar a localização do animal;
2. Armazenamento dos dados dos animais;
3. Localização do equipamento;
4. Dashboard para visualização dos dados;
5. Alertas de eventos de interesse;
6. Compartilhamento dos dados;
7. Geração de relatórios;
8. Login.


## Lista de widgets<sup id="a1">[1](#f1)</sup>

### Basic widgets

- [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html)
- [Column](https://api.flutter.dev/flutter/widgets/Column-class.html)
- [Container](https://api.flutter.dev/flutter/widgets/Container-class.html)
- [Icon](https://api.flutter.dev/flutter/widgets/Icon-class.html)
- [Image](https://api.flutter.dev/flutter/widgets/Image-class.html)
- [Row](https://api.flutter.dev/flutter/widgets/Row-class.html)
- [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html)
- [Text](https://api.flutter.dev/flutter/widgets/Text-class.html)

### Layout widgets

- [Center](https://api.flutter.dev/flutter/widgets/Center-class.html)
- [Expanded](https://api.flutter.dev/flutter/widgets/Expanded-class.html)
- [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)

### Material Components

- [Drawer](https://api.flutter.dev/flutter/material/Drawer-class.html)
- [SimpleDialog](https://api.flutter.dev/flutter/material/SimpleDialog-class.html)


<sub id="f1">1</sub> Lista de widgets que possivelmente serão utilizados.[↩](#a1)



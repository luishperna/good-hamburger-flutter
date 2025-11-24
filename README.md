<div align="center">
  <img height="80" alt="logo" src="https://github.com/user-attachments/assets/381445fe-fe12-4281-8839-cf676d3b62b6" />
</div>
<br>

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Mobile-black?style=for-the-badge&logo=data:image/svg%2Bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTE3LDE5SDdWNUgxN00xNywxSDdDNS44OSwxIDUsMS44OSA1LDNWMjFBMiwyIDAgMCwwIDcsMjNIMTdBMiwyIDAgMCwwIDE5LDIxVjNDMTksMS44OSAxOC4xLDEgMTcsMVoiIGZpbGw9IndoaXRlIi8+PC9zdmc+" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
</div>

---

<h3 align="center">📱 Acabou de sair da "chapa", o seu novo app de pedidos de lanches irresistíveis 🍔</h3>

<div align="center">
  <video src="https://github.com/user-attachments/assets/e2103095-bf1a-41d8-a9c9-65ea787fcf49" width="380" />
</div>

<div align="center">
    <p>
        Escolher o seu pedido nunca foi tão fácil e moderno como agora!
        <br>
        <b>Peça já e veja os descontos especiais que preparamos para você = )</b>
    </p>
</div>

---

# Documentação

## :bookmark_tabs: Sumário

- [:dart: Objetivo](#dart-objetivo)
- [:triangular_ruler: Arquitetura](#triangular_ruler-arquitetura)
- [:file_folder: Estrutura de Pastas](#file_folder-estrutura-feature-first)
- [:man_technologist: Tecnologias e Ferramentas](#man_technologist-tecnologias-e-ferramentas)
- [:computer: Como rodar](#computer-como-rodar)
- [:game_die: Mocks (Dados Simulados)](#game_die-mocks-dados-simulados)
- [:construction: Limitações e Próximos Passos](#construction-limitações-e-próximos-passos)
- [:pencil: Autor](#pencil-autor)
 
---

## :dart: Objetivo

O **Good Hamburger** foi desenvolvido para oferecer uma experiência completa de pedidos de sanduíches e acompanhamentos. O aplicativo simula um ambiente real de produção, abrangendo desde o primeiro acesso do usuário até a finalização do pedido.

**Principais Funcionalidades:**
* **Onboarding & Identificação:** Fluxo de integração e registro simplificado.
* **Navegação:** Splash screen, menu interativo, carrinho de compras e histórico de pedidos.

**Destaques Técnicos:**
O projeto foi construído com foco em escalabilidade e qualidade de código, utilizando arquitetura limpa. A estrutura segue as melhores práticas do mercado atual, incluindo a implementação de testes automatizados e um design de software moderno.

---

## :triangular_ruler: Arquitetura

Para a arquitetura do projeto, foi utilizado o padrão **MVVM (Model-View-ViewModel)** conforme recomendação da [documentação oficial do Flutter](https://docs.flutter.dev/app-architecture), ilustrado abaixo:

<img width="100%" alt="mvvm" src="https://github.com/user-attachments/assets/8173d082-35dd-46fe-9d49-f47831303906" />

---

## :file_folder: Estrutura (Feature-First)

A organização das pastas segue a separação por funcionalidades:

```
assets/                          # Arquivos estáticos
├── images/
└── mocks/                       # Mocks da API (JSON) e dados para testes

docs/                            # Documentos base para início do desenvolvimento
├── architecture/
└── designs/ 

lib/
├── core/                        # Configurações globais e infraestrutura
│   ├── config/
│   ├── di/              
│   ├── router/
│   └── ui/              
│
├── features/                    # Recursos/funcionalidades específicas 
│   ├── cart/                  
│   ├── main/                    # Responsável pela navegação principal
│   ├── menu/
│   ├── onboarding/
│   ├── orders/
│   ├── splash/            
│   └── user/                  
│
├── shared/                      # Recursos compartilhados/reutilizados em várias features
│   ├── domain/                
│   ├── models/               
│   ├── services/               
│   ├── utils/                  
│   └── view_models/            
│
└── main.dart                    # Ponto de início do aplicativo

test/                            # Testes automatizados
└── unit/ 
```

---

## :man_technologist: Tecnologias e Ferramentas

- **Core**
  - Framework: `Flutter`
  - Linguagem de programação: `Dart`

- **Ferramentas de Desenvolvimento**
  - IDE: `Android Studio`
  - Versionamento: `Git` & `GitHub`
  - Qualidade de Código (Linter): `flutter_lints`

- **Arquitetura & Gerenciamento**
  - Gerenciamento de Estado: `Provider`
  - Gerenciamento de Injeção de Dependência: `GetIt`

- **Persistência de Dados**
  - Armazenamento Local: `shared_preferences`
  - Acesso ao Sistema de Arquivos: `path_provider`

- **Interface de Usuário (UI/UX)**
  - Carrossel / Indicadores: `smooth_page_indicator`
  - Notificações In-App: `top_snackbar_flutter`
  - Ícones: `cupertino_icons`

- **Utilitários**
  - Formatação (Moedas/Datas): `intl`

---

## :computer: Como rodar

### Pré-requisitos

- [x] Dispositivo conectado à internet;
- [x] Flutter SDK instalado e configurado;
- [x] Android Studio (ou VS Code) configurado.

### Instalação

1. Siga as [orientações de instalação do Flutter](https://docs.flutter.dev/install);
2. Clone o repositório para a sua máquina ou realize o download do zip;
3. No terminal, na raiz do projeto, execute:

```bash
flutter pub get
```

### Execução

Para rodar o aplicativo, execute:

```bash
flutter run
```

### Testes Unitários

Execute o seguinte comando para rodar os testes (cobertura de cenários de desconto):

```bash
flutter test test/unit/order_calculator_test.dart
```

---

## :game_die: Mocks (Dados Simulados) 

Durante o desenvolvimento, foram utilizados arquivos mocks (localizados em assets/mocks) para simular a comunicação com uma API.

<details> <summary><b>Clique para ver o JSON de MENU</b></summary>

```json
[
  {
    "id": 1,
    "category": "sandwich",
    "name": "Burger",
    "description": "A classic, juicy beef burger served on a fresh bun.",
    "price": 500,
    "imagePath": "assets/mocks/images/menu/item_1.jpg"
  },
  {
    "id": 2,
    "category": "sandwich",
    "name": "Egg",
    "description": "A hearty sandwich featuring fresh eggs and tasty toppings.",
    "price": 450,
    "imagePath": "assets/mocks/images/menu/item_2.jpg"
  },
  {
    "id": 3,
    "category": "sandwich",
    "name": "Bacon",
    "description": "A savory sandwich piled high with crispy bacon and cheese.",
    "price": 700,
    "imagePath": "assets/mocks/images/menu/item_3.jpg"
  },
  {
    "id": 4,
    "category": "fries",
    "name": "Fries",
    "description": "Crispy golden french fries, perfect as a side.",
    "price": 200,
    "imagePath": "assets/mocks/images/menu/item_4.jpg"
  },
  {
    "id": 5,
    "category": "drink",
    "name": "Soft Drink",
    "description": "A refreshing, ice-cold soft drink to complete your meal.",
    "price": 250,
    "imagePath": "assets/mocks/images/menu/item_5.jpg"
  }
]
```

</details>

<details> <summary><b>Clique para ver o JSON de PEDIDOS</b></summary>

```json
[
  {
    "id": 1,
    "code": "2345",
    "date": "2025-11-21T23:33:40.123Z",
    "items": [
      {
        "id": 1,
        "category": "sandwich",
        "name": "Burger",
        "description": "A classic, juicy beef burger served on a fresh bun.",
        "price": 500,
        "imagePath": "assets/mocks/images/menu/item_1.jpg"
      }
    ],
    "subtotal": 500,
    "discount": 0,
    "total": 500,
    "status": "preparing",
    "orderedBy": {
      "name": "Luís"
    }
  },
  {
    "id": 2,
    "code": "2346",
    "date": "2025-11-21T23:33:40.123Z",
    "items": [
      {
        "id": 1,
        "category": "sandwich",
        "name": "Burger",
        "description": "A classic, juicy beef burger served on a fresh bun.",
        "price": 500,
        "imagePath": "assets/mocks/images/menu/item_1.jpg"
      },
      {
        "id": 4,
        "category": "fries",
        "name": "Fries",
        "description": "Crispy golden french fries, perfect as a side.",
        "price": 200,
        "imagePath": "assets/mocks/images/menu/item_4.jpg"
      }
    ],
    "subtotal": 700,
    "discount": 70,
    "total": 630,
    "status": "delivered",
    "orderedBy": {
      "name": "Perna"
    }
  }
]
```

</details>

---

## :construction: Limitações e Próximos Passos

* **Rotas tipadas:** migrar para um roteador com tipagem (ex: `GoRouter`) para segurança na injeção
  de argumentos.
* **API real:** trocar `ApiService` simulado por uma `http` para integração com
  backend e ajustas camadas adaptadas durante a simulação.
* **Testes de Integração:** adicionar testes end-to-end para fluxo do carrinho (adicionar item →
  verificar total → enviar pedido).

---

## :pencil: Autor

| [<img src="https://avatars.githubusercontent.com/u/96630233?s=400&u=3400cfe6ba8fb87692f4f14cbdbef3e5cc996b67&v=4" width=115><br><sub>Luís Henrique Perna</sub>](https://github.com/luishperna) |
| :---: |

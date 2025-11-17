good_hamburger/
├── assets/
│   ├── audio/
│   ├── fonts/
│   ├── icons/
│   └── images/
│
├── docs/
│   ├── architectures/
│   └── designs/
│
├── lib/
│   ├── main.dart             # Ponto de entrada
│   │
│   ├── shared/               # Lógica e UI Compartilhada
│   │   ├── domain/           # Regras de negócio
│   │   │   └── order_calculator.dart
│   │   │
│   │   ├── models/           # Models GLOBAIS
│   │   │   ├── sandwich_model.dart
│   │   │   ├── extra_model.dart
│   │   │   ├── cart_item_model.dart
│   │   │   ├── order_model.dart
│   │   │   └── user_model.dart
│   │   │
│   │   ├── providers/        # ViewModels GLOBAIS (Estado Global)
│   │   │   ├── cart_provider.dart   # (Controla o estado do carrinho)
│   │   │   └── user_provider.dart   # (Armazena o nome do usuário)
│   │   │
│   │   ├── repositories/     # Lógica de Dados
│   │   │   ├── menu_repository.dart
│   │   │   └── orders_repository.dart
│   │   │
│   │   ├── services/         # Chamada a API/Arquivo Local
│   │   │   ├── menu_service.dart    # (Simula busca no JSON do menu)
│   │   │   └── orders_service.dart  # (Simula salvar/buscar no JSON do pedidos)
│   │   │
│   │   ├── utils/            # Utilidades/Ferramentas
│   │   │   ├── constant_util.dart
│   │   │   └── formatter_util.dart
│   │   │
│   │   └── widgets/          # Widgets Personalizados GLOBAIS
│   │       ├── custom_button_widget.dart
│   │       └── custom_app_bar_widget.dart
│   │
│   └── features/             # Telas e Lógica Local
│       │
│       ├── onboarding/       # Tela de Integração
│       │   ├── view/
│       │   │   └── onboarding_view.dart
│       │   ├── models/
│       │   │   └── onboarding_item_model.dart
│       │   └── widgets/
│       │       └── onboarding_carousel_item.dart
│       │
│       ├── user/             # Tela de Identificação do Usuário
│       │   ├── view/
│       │   │   └── user_view.dart
│       │   └── widgets/
│       │       └── user_form.dart
│       │       # Obs: Provider 'user_provider.dart' é o global (de shared/)
│       │
│       ├── menu/             # Tela de Menu
│       │   ├── view/
│       │   │   └── menu_view.dart
│       │   ├── provider/
│       │   │   └── menu_provider.dart # (ViewModel local: controla filtros, loading)
│       │   └── widgets/
│       │       ├── sandwich_card_widget.dart
│       │       └── filter_widgets.dart
│       │
│       ├── cart/             # Tela do Carrinho
│       │   ├── view/
│       │   │   └── cart_view.dart
│       │   ├── provider/
│       │   │   └── cart_checkout_provider.dart # (ViewModel local: controla envio)
│       │   └── widgets/
│       │       ├── cart_item_tile_widget.dart
│       │       └── user_name_input_widget.dart
│       │
│       └── orders/           # Tela de Pedidos
│           ├── view/
│           │   └── orders_list_view.dart
│           ├── provider/
│           │   └── orders_list_provider.dart # (ViewModel local: controla busca)
│           └── widgets/
│               └── order_list_tile_widget.dart
│
├── test/                     # Testes
│   ├── unit/                 # Testes de Unidade
│   │   └── order_calculator_test.dart # <-- Seu teste bônus 
│   │
│   ├── widget/               # Testes de UI (Widgets)
│   │   ├── menu_view_test.dart
│   │   ├── cart_view_test.dart
│   │   └── ...
│   │
│   └── integration/          # Testes End-to-End (Fluxo)
│       └── app_flow_test.dart
│
└── ...
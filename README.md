# 🍔 GOOD HAMBURGER — Mobile Ordering App

Aplicação mobile frontend para um sistema de pedidos de hamburgueria, desenvolvida com foco em *
*regras de negócio robustas**, **arquitetura limpa** e **padrões profissionais de desenvolvimento**.

---

## 🎯 Objetivo

Construir um app de pedidos aplicando corretamente:

* Regras de negócio (descontos + unicidade do carrinho)
* Arquitetura limpa orientada a features
* Injeção de dependência
* Gerenciamento de estado com ViewModels
* Testes unitários de lógica de domínio

---

## ✨ Conquistas Arquiteturais

| Conquista                       | Demonstração                                                                                      | Requisito Atendido              |
|---------------------------------|---------------------------------------------------------------------------------------------------|---------------------------------|
| **Arquitetura Limpa**           | Estrutura *Feature-First*, separando Domain, Repository e ViewModel                               | Padrão de Arquitetura           |
| **Testes Unitários**            | Projeto de testes validando a lógica de cálculos de desconto                                      | Bônus — Unit Test Project       |
| **Injeção de Dependência (DI)** | Uso de **GetIt** para desacoplar criação de Repositórios e ViewModels da UI                       | Uso de State Management Library |
| **Scoped Providers**            | Injeção de ViewModels específicos por rota (ex: `MenuViewModel` em `/main`) via *factory pattern* | Gerenciamento de Estado         |
| **Simulação de API**            | `ApiService` genérico simulando chamada HTTP (inclui latência de 1s)                              | Data Fetching                   |

---

## 💻 Estrutura do Projeto (Feature-First)

```
lib/
├── core/                        
│   ├── di/                      # Configuração do GetIt
│   ├── router/                  # Rotas nomeadas + injeção de providers
│   └── utils/                   # Extensões (moeda, data, helpers)
│
├── features/                    # Telas organizadas por domínio
│   ├── cart/                    # Lógica e UI do Carrinho
│   ├── menu/                    # Lógica e UI do Menu/Listagem
│   └── user/                    # Lógica do Usuário/Sessão
│
├── shared/                      # Componentes reutilizáveis que conhecem o negócio
│   ├── domain/                  # OrderCalculator (Lógica de Desconto Pura)
│   ├── models/                  # UserModel, OrderModel, ItemModel
│   └── view_models/             # CartGlobalViewModel, UserGlobalViewModel
│
└── main.dart                    # Ponto de entrada (Bootstrap)
```

---

## ⚙️ Regras de Negócio e Implementação

As regras de negócio foram implementadas nas camadas apropriadas:

### 1. Descontos (Camada Domain)

A lógica reside em `OrderCalculator`, que verifica as categorias dos itens para aplicar as regras:

* **20% Combo:** Sanduíche + Batata + Bebida.
* **15% Combo:** Sanduíche + Bebida.
* **10% Combo:** Sanduíche + Batata.

> Observação: os descontos são aplicados uma única vez por pedido, seguindo a priorização acima (
> 20% > 15% > 10%).

### 2. Validação do Carrinho (Regra de Unicidade)

`CartGlobalViewModel` assegura que apenas **um item por categoria** (sanduíche, batata, bebida)
possa existir no carrinho. Se o usuário tentar adicionar um segundo item da mesma categoria, o
ViewModel lança uma exceção tratada pela UI para exibir um aviso amigável.

### 3. Persistência de Dados

* Estado do carrinho e lista de pedidos: **em memória (RAM)** durante a sessão.
* Nome do usuário e status de onboarding: persistidos em disco via `shared_preferences` usando
  `LocalPreferencesService`.

---

## 🧩 Componentes Principais (exemplos)

### OrderCalculator (pseudocódigo)

```dart
class OrderCalculator {
  Money calculateTotal(List<Item> items) {
    // lógica de soma + aplicação de desconto conforme categorias
  }
}
```

### CartGlobalViewModel (pseudocódigo)

```dart
class CartGlobalViewModel {
  final List<Item> _items = [];

  void addItem(Item item) {
    if (_items.any((i) => i.category == item.category)) {
      throw DuplicateItemException('Já existe um item desta categoria');
    }
    _items.add(item);
  }
}
```

---

## 🖥️ Como Construir, Rodar e Testar

### Setup

```bash
flutter pub get
# (Opcional) gerar ícones
dart run flutter_launcher_icons
```

### Execução

O app inicializa na rota `/` (Splash Screen) e checa o estado inicial.

```bash
flutter run
```

### Teste Unitário (Bônus)

O teste cobre todos os cenários de desconto, incluindo arredondamento de centavos:

```bash
flutter test test/unit/order_calculator_test.dart
```

---

## 🚧 Limitações e Próximos Passos

* **Rotas tipadas:** migrar para um roteador com tipagem (ex: `GoRouter`) para segurança na injeção
  de argumentos.
* **API real:** trocar `ApiService` simulado por `http.get` ou `Dio.get` para integração com
  backend e ajustas camadas adaptadas durante a simulação.
* **Testes de Integração:** adicionar testes end-to-end para fluxo do carrinho (adicionar item →
  verificar total → enviar pedido).

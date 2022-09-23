# Async Module

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A Brick to create simple async features & modules for FLutter using Riverpod and Freezed

The Brick uses:
- [Riverpod](https://pub.dev/packages/riverpod) and
- [Flutter Riverpod](https://pub.dev/packages/flutter_riverpod) for state management. And
- [Build Runner](https://pub.dev/packages/build_runner) with
- [Freezed](https://pub.dev/packages/freezed) and
- [Freezed Annotation](https://pub.dev/packages/freezed_annotation) for model generation.


## Requirements 🚀

Before you move forward, be sure to have 
- all dependencies mentioned above added to your project trough your pubspec.yaml


## How to use 🚀

First create your mason project by running `mason init` on any folder that you want.

Afterwards, add the library to your project.

```shell
mason add async_module
```

Now generate the files. 

You can either fill in the variables on your CLI:

```shell
mason make async_module --module_name "Counter" --wrap_with_page false
```

**OR**

let CLI guide you through the process

```shell
mason make async_module
```

## Variables ✨

| Variable               | Description                  | Default         | Type      |
|------------------------|------------------------------|-----------------|-----------|
| `module_name`          | Name of your module          | Counter         | `string`  |
| `wrap_with_page`       | Wrap module with page        | false           | `boolean` |

## Outputs 📦

```
--module_name "Counter" --wrap_with_page false
├── counter
│   ├── state_mgmt
│   │   ├── counter_controller.dart
│   │   ├── counter_state.dart
│   │   ├── counter_state.freezed.dart
│   │   └── state_mgmt.dart
│   ├── view
│   │   ├── counter.dart
│   │   └── view.dart
│   └── counter.dart
└── ...
```

```
--module_name "Counter" --wrap_with_page true
├── counter
│   ├── state_mgmt
│   │   ├── counter_controller.dart
│   │   ├── counter_state.dart
│   │   ├── counter_state.freezed.dart
│   │   └── state_mgmt.dart
│   ├── view
│   │   ├── counter_page.dart
│   │   ├── counter.dart
│   │   └── view.dart
│   └── counter.dart
└── ...
```
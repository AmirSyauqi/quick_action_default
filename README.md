# quick_action_default

A reusable Flutter quick-action widget with theme-aware defaults and three visual styles:

- `QuickActionsVariant.filled`
- `QuickActionsVariant.outlined`
- `QuickActionsVariant.glass` (liquid-glass style)

## Preview

### 🌞 Light Theme 🌙 Dark Theme
<p float="left">
  <img src="https://raw.githubusercontent.com/AmirSyauqi/quick_action_default/main/assets/screenshots/preview_light.png" width="45%" />
  <img src="https://raw.githubusercontent.com/AmirSyauqi/quick_action_default/main/assets/screenshots/preview_dark.png" width="45%" />
</p>



## Features

- Simple action model: `QuickActionItem`
- Optional custom colors and spacing
- Light/dark theme support
- Built-in tap handling and accessibility semantics


## Installation

Add to `pubspec.yaml`:

```yaml
dependencies:
  quick_action_default: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:quick_action_default/quick_action_default.dart';

final actions = <QuickActionItem>[
  const QuickActionItem(title: 'Explore', icon: Icons.explore),
  const QuickActionItem(title: 'Favorites', icon: Icons.favorite),
  const QuickActionItem(title: 'History', icon: Icons.history),
  QuickActionItem(title: 'Share', icon: Icons.send, onTap: () {}),
];

QuickActionDefault(
  actions: actions,
  variant: QuickActionsVariant.glass,
)
```

## Customization

```dart
QuickActionDefault(
  actions: actions,
  variant: QuickActionsVariant.outlined,
  backgroundColor: Colors.white,
  iconColor: Colors.deepOrange,
  textColor: Colors.deepOrange,
  outlineColor: Colors.deepOrange,
  iconSize: 30,
  borderRadius: 18,
  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
  margin: const EdgeInsets.symmetric(horizontal: 20),
)
```

## API

`QuickActionItem`
- `title` (`String`)
- `icon` (`IconData`)
- `onTap` (`VoidCallback?`)

`QuickActionDefault`
- `actions` (`List<QuickActionItem>`, required)
- `variant` (`QuickActionsVariant`, default `filled`)
- `maxActions` (`int`, default `4`)
- `margin` (`EdgeInsetsGeometry`)
- `padding` (`EdgeInsetsGeometry`)
- `iconSize` (`double`)
- `borderRadius` (`double`)
- `backgroundColor` (`Color?`)
- `iconColor` (`Color?`)
- `textColor` (`Color?`)
- `outlineColor` (`Color?`)

## Example App

See a runnable demo in:

- `example/lib/main.dart`

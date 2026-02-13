import 'dart:ui';

import 'package:flutter/material.dart';

enum QuickActionsVariant { filled, outlined, glass }

class QuickActionItem {
  final String title;
  final IconData icon;
  final Color? iconColor;
  final Color? textColor;
  final VoidCallback? onTap;

  const QuickActionItem({
    required this.title,
    required this.icon,
    this.iconColor,
    this.textColor,
    this.onTap,
  });
}

class QuickActionDefault extends StatelessWidget {
  final QuickActionsVariant variant;
  final List<QuickActionItem> actions;
  final int maxActions;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double iconSize;
  final double textSize;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? outlineColor;

  const QuickActionDefault({
    super.key,
    this.variant = QuickActionsVariant.filled,
    required this.actions,
    this.maxActions = 9,
    this.margin = const EdgeInsets.symmetric(horizontal: 16.0),
    this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
    this.iconSize = 32,
    this.textSize = 14,
    this.borderRadius = 16,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.outlineColor,
  }) : assert(actions.length > 0, 'actions cannot be empty'),
       assert(maxActions > 0, 'maxActions must be > 0'),
       assert(
         actions.length <= maxActions,
         'actions length must be <= maxActions',
       );

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final scheme = Theme.of(context).colorScheme;
    final visibleActions = actions.take(maxActions).toList();
    final cardColor = backgroundColor ?? scheme.surfaceContainer;
    final actionIconColor =
        iconColor ?? (isDarkMode ? scheme.primary : scheme.onPrimaryContainer);
    final actionTextColor =
        textColor ??
        (isDarkMode ? scheme.onSurface : scheme.onPrimaryContainer);

    final defaultShadow = BoxShadow(
      color: Colors.black.withValues(alpha: isDarkMode ? 0.22 : 0.08),
      blurRadius: isDarkMode ? 14 : 10,
      offset: const Offset(0, 4),
    );

    late final BoxDecoration decoration;
    switch (variant) {
      case QuickActionsVariant.filled:
        decoration = BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [defaultShadow],
        );
        break;
      case QuickActionsVariant.outlined:
        decoration = BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: outlineColor ?? scheme.outlineVariant),
        );
        break;
      case QuickActionsVariant.glass:
        decoration = BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withValues(alpha: isDarkMode ? 0.14 : 0.45),
              Colors.white.withValues(alpha: isDarkMode ? 0.08 : 0.25),
            ],
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color:
                outlineColor ??
                scheme.outlineVariant.withValues(
                  alpha: isDarkMode ? 0.22 : 0.70,
                ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDarkMode ? 0.2 : 0.05),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        );
        break;
    }

    final content = Row(
      children: visibleActions.map((action) {
        return Expanded(
          child: _ActionItem(
            action: action,
            iconSize: iconSize,
            iconColor: action.iconColor ?? actionIconColor,
            textSize: textSize,
            textColor: action.textColor ?? actionTextColor,
          ),
        );
      }).toList(),
    );

    return Padding(
      padding: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: variant == QuickActionsVariant.glass
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 26, sigmaY: 26),
                child: Container(
                  width: double.infinity,
                  padding: padding,
                  decoration: decoration,
                  child: content,
                ),
              )
            : Container(
                width: double.infinity,
                padding: padding,
                decoration: decoration,
                child: content,
              ),
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  const _ActionItem({
    required this.action,
    required this.iconSize,
    required this.iconColor,
    required this.textSize,
    required this.textColor,
  });

  final QuickActionItem action;
  final double iconSize;
  final double textSize;
  final Color iconColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: action.title,
      child: InkWell(
        onTap: action.onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(action.icon, size: iconSize, color: iconColor),
              const SizedBox(height: 8),
              Text(
                action.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: textColor,
                  fontSize: textSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:bloodbond/common/enums/page_transition_type.dart';
import 'package:flutter/material.dart';

/// Page transition class extends PageRouteBuilder
class TransitionPageRoute<T> extends PageRoute<T> {
  /// Page transition constructor. We can pass the next page as a child,
  TransitionPageRoute({
    Key? key,
    required this.builder,
    this.type,
    this.matchingBuilder = const CupertinoPageTransitionsBuilder(),
    this.curve = Curves.linear,
    super.settings,
    this.maintainState = true,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
  }) : isIos = Platform.isIOS;

  /// Child for your next page
  final WidgetBuilder builder;

  /// Transition types
  final PageTransitionType? type;

  final PageTransitionsBuilder matchingBuilder;

  /// Curves for transitions
  final Curve curve;

  final Duration duration;

  final Duration reverseDuration;

  final bool isIos;

  @override
  final bool maintainState;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    switch (type) {
      case PageTransitionType.fade:
        final transitionChild = SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: const Offset(0.0, 0.25),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.fastOutSlowIn)),
          ),
          child: FadeTransition(
            opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
            child: child,
          ),
        );

        return isIos
            ? matchingBuilder.buildTransitions(
                this,
                context,
                animation,
                secondaryAnimation,
                transitionChild,
              )
            : transitionChild;

      case PageTransitionType.fadeIn:
        return FadeTransition(
          opacity: animation,
          child: child,
        );

      case PageTransitionType.rightToLeft:
        final transitionChild = SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );

        return isIos
            ? matchingBuilder.buildTransitions(
                this,
                context,
                animation,
                secondaryAnimation,
                transitionChild,
              )
            : transitionChild;

      case PageTransitionType.leftToRight:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );

      case PageTransitionType.downToUp:
        final transitionChild = SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );

        return isIos
            ? matchingBuilder.buildTransitions(
                this,
                context,
                animation,
                secondaryAnimation,
                transitionChild,
              )
            : transitionChild;

      case PageTransitionType.upToDown:
        final transitionChild = SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );

        return isIos
            ? matchingBuilder.buildTransitions(
                this,
                context,
                animation,
                secondaryAnimation,
                transitionChild,
              )
            : transitionChild;

      default:
        final PageTransitionsTheme theme =
            Theme.of(context).pageTransitionsTheme;
        return theme.buildTransitions<T>(
          this,
          context,
          animation,
          secondaryAnimation,
          child,
        );
    }
  }

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  Widget buildContent(BuildContext context) => builder(context);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final Widget result = buildContent(context);
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: result,
    );
  }

  @override
  Duration get transitionDuration => duration;

  @override
  Duration get reverseTransitionDuration => reverseDuration;
}

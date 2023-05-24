import 'package:mason/mason.dart';

void run(HookContext context) {
  final style = context.vars['style'];
  context.vars = {
    ...context.vars,
    'use_basic': style == 'basic',
    'use_equatable': style == 'equatable',
    'use_freezed': style == 'freezed',
  };
}

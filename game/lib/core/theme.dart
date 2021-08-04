import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:theme_provider/theme_provider.dart';

///Поставщик тем для приложение.
///Пример:
///class App extends StatelessWidget {
///   const App({Key? key}) : super(key: key);
///
///   @override
///   Widget build(BuildContext context) {
///     return ThemeBuilder(
///       builder: (_) => const MaterialApp(
///         initialRoute: "/",
///       ),
///     );
///   }
/// }
///
///Добавьте тему
/// Пример:
/// themes: <AppTheme>[
///           AppTheme(
///               id: "defaultThemeLight",
///               data: DefauiltThemeData().theme,
///               description: "Светлая тема по умолчанию"),
///            AppTheme(
///               id: "defaultThemeDark",
///               data: DefauiltThemeData().theme,
///               description: "Темная тема по умолчанию")
///         ],
class ThemeBuilder extends StatelessWidget {
  ///Принимает только MaterialApp or CupertinoApp.
  final Widget child;
  const ThemeBuilder({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
        defaultThemeId: "default_theme_light",
        loadThemeOnInit: false,
        saveThemesOnChange: true,
        providerId: "default",
        onInitCallback: (controller, previouslySavedThemeFuture) async {
          String? savedTheme = await previouslySavedThemeFuture;
          if (savedTheme != null) {
            controller.setTheme(savedTheme);
          } else {
            Brightness platformBrightness =
                SchedulerBinding.instance?.window.platformBrightness ??
                    Brightness.light;
            if (platformBrightness == Brightness.dark) {
              controller.setTheme('default_theme_dark');
            } else {
              controller.setTheme('default_theme_light');
            }
            controller.forgetSavedTheme();
          }
        },
        themes: <AppTheme>[
          AppTheme(
            id: "default_theme_light",
            data: DefauiltLightThemeData().theme,
            description: "Светлая тема по умолчанию",
          ),
          AppTheme(
              id: "default_theme_dark",
              data: DefauiltDarkThemeData().theme,
              description: "Темная тема по умолчанию")
        ],
        child: ThemeConsumer(
          child: child,
        ));
  }
}

///Розширьте этот клас для добавление новой темы.
abstract class ThemeDataBase {
  ThemeData get theme;
}

///Тема по умолчанию, предполагается что приложение будет использовать только
///одну тему. Но также есть возможность добавить темы в приложение.
class DefauiltLightThemeData extends ThemeDataBase {
  ///Цвет фона по умолчанию
  static const Color backgroundAppColor = Color(0xFFBBDEFB);

  ///Text("Please select image you want to play")
  ///Text("Select difficulty")
  ///Text("Select image...")
  ///Text("/test_image.png")
  ///Text("Time:)
  ///Text("Items left")
  static const TextStyle defaultHeadline1 = TextStyle(
    backgroundColor: Colors.transparent,
    color: Color(0xFF000000),
  );

  @override
  ThemeData get theme {
    return ThemeData(
        scaffoldBackgroundColor: backgroundAppColor,
        textTheme: const TextTheme(
          headline1: defaultHeadline1,
        ));
  }
}

class DefauiltDarkThemeData extends ThemeDataBase {
  ///Цвет фона по умолчанию
  static const Color backgroundAppColor = Color(0xFF263238);
  static const TextStyle defaultTextStyleText = TextStyle(
    backgroundColor: Colors.transparent,
    color: Color(0xFFFFFFFF),
    fontSize: 24,
  );
  @override
  ThemeData get theme {
    return ThemeData(scaffoldBackgroundColor: backgroundAppColor);
  }
}

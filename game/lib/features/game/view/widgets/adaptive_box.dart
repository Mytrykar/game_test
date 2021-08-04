import 'package:flutter/material.dart';

///Бокс который при уменьшении екрана уменьшается до указаной величины
///а потом пропадает
class AdaptiveBox extends StatelessWidget {
  ///Задайте размеры бокса
  final Size maxsize;

  ///Минимальный размер бокса, когда размер бокса станет меньше этой величины
  ///вернет SizedBox с текущим размером екрана. Если минимальный
  ///размер не указан вернет SizedBox исходя из [maxsize]
  final Size minSize;

  ///Виджет, ограничен параметрами бокса
  final Widget child;

  const AdaptiveBox(
      {Key? key,
      required this.maxsize,
      required this.child,
      this.minSize = const Size(300.0, 300.0)})
      : assert(maxsize > minSize),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = MediaQuery.of(context).size;
        if (constraints.maxWidth <= minSize.width ||
            constraints.maxHeight <= minSize.height ||
            minSize > size) {
          return const SizedBox();
        } else {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: maxsize.height, maxWidth: maxsize.width),
              child: child,
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';

class CDialog {
  /// Shows a custom dialog with various customization options
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? imageUrl,
    bool isGif = false,
    bool circularImage = false,
    Color backgroundColor = Colors.white,
    Color titleColor = Colors.black,
    Color messageColor = Colors.black87,
    DialogMediaPosition mediaPosition = DialogMediaPosition.top,
    double? imageWidth,
    double? imageHeight,
    BorderRadius? borderRadius,
    EdgeInsets contentPadding = const EdgeInsets.all(24.0),
    TextStyle? titleStyle,
    TextStyle? messageStyle,
    List<DialogAction>? actions,
    bool barrierDismissible = true,
    BoxShadow? boxShadow,
    double? maxWidth,
    double? maxHeight,
    DialogAnimation animation = DialogAnimation.scale,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation1, animation2) => Container(),
      transitionBuilder: (context, animation1, animation2, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation1,
          curve: Curves.easeOutBack,
        );

        return _buildAnimatedDialog(
          animation: animation,
          curvedAnimation: curvedAnimation,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
            ),
            backgroundColor: backgroundColor,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: maxWidth ?? MediaQuery.of(context).size.width * 0.85,
                maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.85,
              ),
              child: _DialogContent(
                title: title,
                message: message,
                imageUrl: imageUrl,
                isGif: isGif,
                circularImage: circularImage,
                titleColor: titleColor,
                messageColor: messageColor,
                mediaPosition: mediaPosition,
                imageWidth: imageWidth,
                imageHeight: imageHeight,
                contentPadding: contentPadding,
                titleStyle: titleStyle,
                messageStyle: messageStyle,
                actions: actions,
                boxShadow: boxShadow,
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildAnimatedDialog({
    required DialogAnimation animation,
    required Animation<double> curvedAnimation,
    required Widget child,
  }) {
    switch (animation) {
      case DialogAnimation.scale:
        return ScaleTransition(
          scale: curvedAnimation,
          child: child,
        );
      case DialogAnimation.fade:
        return FadeTransition(
          opacity: curvedAnimation,
          child: child,
        );
      case DialogAnimation.slideFromTop:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );
      case DialogAnimation.slideFromBottom:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );
    }
  }
}

enum DialogMediaPosition {
  top,
  bottom,
  left,
  right,
}

enum DialogAnimation {
  scale,
  fade,
  slideFromTop,
  slideFromBottom,
}

class DialogAction {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? backgroundColor;
  final double? width;
  final BorderRadius? borderRadius;
  final EdgeInsets padding;
  final TextStyle? textStyle;

  DialogAction({
    required this.text,
    required this.onPressed,
    this.textColor,
    this.backgroundColor,
    this.width,
    this.borderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.textStyle,
  });
}

class _DialogContent extends StatelessWidget {
  final String title;
  final String message;
  final String? imageUrl;
  final bool isGif;
  final bool circularImage;
  final Color titleColor;
  final Color messageColor;
  final DialogMediaPosition mediaPosition;
  final double? imageWidth;
  final double? imageHeight;
  final EdgeInsets contentPadding;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final List<DialogAction>? actions;
  final BoxShadow? boxShadow;

  const _DialogContent({
    required this.title,
    required this.message,
    this.imageUrl,
    this.isGif = false,
    this.circularImage = false,
    required this.titleColor,
    required this.messageColor,
    required this.mediaPosition,
    this.imageWidth,
    this.imageHeight,
    required this.contentPadding,
    this.titleStyle,
    this.messageStyle,
    this.actions,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: contentPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _buildContent(),
        ),
      ),
    );
  }

  List<Widget> _buildContent() {
    final List<Widget> content = [];

    // Title
    final titleWidget = Text(
      title,
      style: titleStyle ??
          TextStyle(
            color: titleColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
      textAlign: TextAlign.center,
    );

    // Message
    final messageWidget = Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        message,
        style: messageStyle ??
            TextStyle(
              color: messageColor,
              fontSize: 16,
            ),
        textAlign: TextAlign.center,
      ),
    );

    // Image
    if (imageUrl != null) {
      final imageWidget = Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: _buildImage(),
      );

      switch (mediaPosition) {
        case DialogMediaPosition.top:
          content.addAll([imageWidget, titleWidget, messageWidget]);
          break;
        case DialogMediaPosition.bottom:
          content.addAll([titleWidget, messageWidget, imageWidget]);
          break;
        case DialogMediaPosition.left:
          content.add(
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageWidget,
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [titleWidget, messageWidget],
                  ),
                ),
              ],
            ),
          );
          break;
        case DialogMediaPosition.right:
          content.add(
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [titleWidget, messageWidget],
                  ),
                ),
                const SizedBox(width: 16),
                imageWidget,
              ],
            ),
          );
          break;
      }
    } else {
      content.addAll([titleWidget, messageWidget]);
    }

    // Actions
    if (actions != null && actions!.isNotEmpty) {
      content.add(
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: actions!.map((action) {
              return MaterialButton(
                onPressed: action.onPressed,
                color: action.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: action.borderRadius ?? BorderRadius.circular(8),
                ),
                minWidth: action.width,
                padding: action.padding,
                child: Text(
                  action.text,
                  style: action.textStyle ??
                      TextStyle(
                        color: action.textColor ?? Colors.blue,
                      ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }

    return content;
  }

  Widget _buildImage() {
    Widget image;
    if (isGif) {
      image = Image.network(
        imageUrl!,
        width: imageWidth ?? 120,
        height: imageHeight ?? 120,
        fit: BoxFit.cover,
      );
    } else {
      image = Image.asset(
        imageUrl!,
        width: imageWidth ?? 120,
        height: imageHeight ?? 120,
        fit: BoxFit.cover,
      );
    }

    if (circularImage) {
      image = ClipOval(child: image);
    }

    if (boxShadow != null) {
      image = Container(
        decoration: BoxDecoration(
          boxShadow: [boxShadow!],
        ),
        child: image,
      );
    }

    return image;
  }
}
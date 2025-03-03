import 'package:lbzsunalarm/ui.dart';

class PrimaryBigButton extends StatelessWidget {
  const PrimaryBigButton({
    required this.text,
    required this.onPressed,
    this.inactive = false,
    super.key,
  });
  final String text;
  final VoidCallback onPressed;
  final bool inactive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: inactive ? null : onPressed,
      child: AdaptiveSizeDecorated(
        width: defaultContentWidth,
        height: 54,
        decoration: BoxDecoration(
          gradient:
              inactive ? inactiveLinearPrimaryGradient : linearPrimaryGradient,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Text(text, style: default14w600.copyWith(color: primary)),
        ),
      ),
    );
  }
}

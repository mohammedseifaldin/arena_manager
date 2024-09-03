import 'package:arena_manager/core/strings/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomErrorWidget extends StatelessWidget {
  final String icon;
  final String primaryMessage;
  final String? secondaryMessage;
  final VoidCallback? retryFun;

  const CustomErrorWidget({
    super.key,
    this.icon = AppAssets.error,
    required this.primaryMessage,
    this.secondaryMessage,
    this.retryFun,
  });
  @override
  Widget build(BuildContext context) => Center(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                width: 75,
                height: 75,
                theme: const SvgTheme(currentColor: Colors.yellow),
                placeholderBuilder: (_) => const Icon(
                  Icons.error_outline,
                  size: 35,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                primaryMessage,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (secondaryMessage != null)
                Text(
                  secondaryMessage!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 5),
              if (retryFun != null) IconButton(onPressed: retryFun, icon: const Icon(Icons.refresh))
            ],
          ),
        ),
      );
}

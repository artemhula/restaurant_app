import 'package:flutter/material.dart';
import 'package:restaurant/common/theme.dart';

SnackBar getErrorSnackbar(String message) => SnackBar(
      backgroundColor: Colors.orange.shade700,
      content: Text(
        message,
        style: theme.textTheme.labelMedium!.copyWith(color: Colors.white),
      ),
    );

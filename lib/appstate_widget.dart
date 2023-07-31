/// Making [StatefulWidget] prettier and less boilerplate.
library appstate_widget;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
part 'src/app_image.dart';
part 'src/app_log.dart';
part 'src/app_route.dart';
part 'src/app_state.dart';
part 'src/app_builder.dart';
part 'src/app_extension.dart';
part 'src/app_button.dart';

typedef JSON = Map<String, dynamic>;

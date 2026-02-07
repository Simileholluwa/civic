import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ProjectPlainTextDescription extends StatelessWidget {
  const ProjectPlainTextDescription({required this.project, super.key});
  final Project project;
  static final Map<int, String> _plainTextCache = <int, String>{};

    String _resolvePlainTextDescription() {
    final projectId = project.id;
    var description = '';
    if (projectId != null && _plainTextCache.containsKey(projectId)) {
      description = _plainTextCache[projectId]!;
    } else {
      final raw = project.description;
      if (raw != null) {
        final dynamic decoded = jsonDecode(raw);
        if (decoded is List) {
          description = Document.fromJson(decoded).toPlainText();
        } else if (decoded is Map<String, dynamic>) {
          description = Document.fromJson([decoded]).toPlainText();
        }
      }
      if (projectId != null) {
        _plainTextCache[projectId] = description;
      }
    }
    return description;
  }

  @override
  Widget build(BuildContext context) {
    final description = _resolvePlainTextDescription();
    return ContentExpandableText(
      text: description,
      onToggleTextTap: () {},
      hasImage: true,
      maxLines: 3,
    );
  }
}

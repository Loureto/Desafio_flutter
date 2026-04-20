import 'package:flutter/material.dart';

import '../presentation.dart';

class AnnotationDetailPage extends StatefulWidget {
  final AnnotationDetailViewModel viewmodel;

  const AnnotationDetailPage({super.key, required this.viewmodel});

  @override
  State<AnnotationDetailPage> createState() => _AnnotationDetailPageState();
}

class _AnnotationDetailPageState extends State<AnnotationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

import '../media_provider.dart';

/// Displays PDFs
class PdfInteractiveMedia extends StatelessWidget {
  final MediaProvider mediaProvider;
  PdfInteractiveMedia({super.key, required this.mediaProvider});

  @override
  Widget build(BuildContext context) {
    final provider = mediaProvider;
    if (provider is MemoryMediaProvider) {
      return PdfViewer.data(provider.data, sourceName: provider.name);
    } else if (provider is UrlMediaProvider) {
      return PdfViewer.uri(Uri.parse(provider.url));
    } else if (provider is AssetMediaProvider) {
      return PdfViewer.asset(provider.assetName);
    } else {
      throw StateError('Unsupported media provider $provider');
    }
  }
}

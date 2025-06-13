import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:seoul_pet_adoption/services/api_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailScreen extends ConsumerWidget {
  final int animalId;

  const DetailScreen({
    super.key,
    required this.animalId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalAsync = ref.watch(animalDetailProvider(animalId));

    if (animalAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (animalAsync.hasError) {
      return Center(
        child: Text('Error: ${animalAsync.error}'),
      );
    }

    final animal = animalAsync.value!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('상세 정보'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                'https://example.com/images/${animal.seq}.jpg', // 실제 이미지 URL로 변경 필요
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.pets,
                      size: 48,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal.animalNm,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${animal.animalType} · ${animal.animalSex == 'M' ? '수컷' : '암컷'} · ${animal.weightKg}kg',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    animal.adoptStatus,
                    style: TextStyle(
                      fontSize: 16,
                      color: animal.adoptStatus == '입양문의가능' ? Colors.green : Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (animal.movieUrl.isNotEmpty) ...[
                    YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: YoutubePlayer.convertUrlToId(animal.movieUrl)!,
                        flags: const YoutubePlayerFlags(
                          autoPlay: false,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  Html(
                    data: animal.cont,
                    style: {
                      'body': Style(
                        fontSize: FontSize(16),
                        lineHeight: LineHeight(1.5),
                      ),
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
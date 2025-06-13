import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:seoul_pet_adoption/services/api_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:seoul_pet_adoption/features/home/presentation/widgets/chips.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final int animalId;

  const DetailScreen({
    super.key,
    required this.animalId,
  });

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  int selectedImageIdx = 0;

  @override
  Widget build(BuildContext context) {
    final animalAsync = ref.watch(animalDetailProvider(widget.animalId));

    Widget body;
    if (animalAsync.isLoading) {
      body = const Center(child: CircularProgressIndicator());
    } else if (animalAsync.hasError) {
      body = Center(child: Text('Error: \\${animalAsync.error}'));
    } else {
      final animal = animalAsync.value!;
      final images = animal.IMG_URLS;
      final mainImage = (images.isNotEmpty && selectedImageIdx < images.length)
          ? images[selectedImageIdx]
          : null;
      body = SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 이미지
              AspectRatio(
                aspectRatio: 1,
                child: mainImage != null
                    ? Image.network(
                        mainImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.pets, size: 48, color: Colors.grey),
                        ),
                      )
                    : Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.pets, size: 48, color: Colors.grey),
                      ),
              ),
              if (images.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    height: 60,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      itemCount: images.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, idx) => GestureDetector(
                        onTap: () => setState(() => selectedImageIdx = idx),
                        child: Container(
                          decoration: BoxDecoration(
                            border: idx == selectedImageIdx
                                ? Border.all(color: Colors.green, width: 2)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: images[idx],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                width: 60,
                                height: 60,
                                color: Colors.grey[200],
                                child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                              ),
                              errorWidget: (context, url, error) => Container(
                                width: 60,
                                height: 60,
                                color: Colors.grey[300],
                                child: const Icon(Icons.pets, size: 28, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 16),
              // 정보 chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  InfoChip(label: '성별', child: GenderChip(animal.ANIMAL_SEX)),
                  InfoChip(label: '이름', child: DefaultChip(animal.ANIMAL_NM)),
                  InfoChip(label: '입양상태', child: StatusChip(animal.ADOPT_STATUS)),
                  InfoChip(label: '출생년도', child: DefaultChip(animal.ANIMAL_BRITH_YMD)),
                  InfoChip(label: '종', child: AnimalTypeChip(animal.ANIMAL_TYPE, animal.ANIMAL_BRITH_YMD)),
                  InfoChip(label: '입소날짜', child: DefaultChip(animal.ADMISSION_DT)),
                  InfoChip(label: '품종', child: BreedChip(animal.ANIMAL_BREED)),
                  InfoChip(label: '동물 고유번호', child: DefaultChip(animal.id)),
                  InfoChip(label: '임시보호상태', child: DefaultChip(animal.FOSTER_STATUS)),
                  InfoChip(label: '체중', child: WeightChip(animal.WEIGHT_KG)),
                ],
              ),
              const SizedBox(height: 16),
              // 소개내용
              const Text('소개내용', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Html(
                data: animal.CONT,
                onLinkTap: (url, attributes, element) async {
                  final uri = Uri.parse(url!);
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  
                },
                style: {
                  "a": Style(
                    color: Colors.blue,
                    textDecoration: TextDecoration.underline,
                  ),
                },
              ),
              const SizedBox(height: 16),
              // 동영상
              if (animal.MOVIE_URL.isNotEmpty)
                YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(animal.MOVIE_URL) ?? '',
                    flags: const YoutubePlayerFlags(
                      autoPlay: false,
                      controlsVisibleAtStart: true,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('상세 정보'),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () async {
            final url = Uri.parse('https://news.seoul.go.kr/env/adoptinfo');
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            }
          },
          child: const Text('입양 절차 안내', style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
      body: body,
    );
  }
} 
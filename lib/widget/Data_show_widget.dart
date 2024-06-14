import 'package:flutter/material.dart';

class DataShowWidget extends StatelessWidget {
  const DataShowWidget({
    super.key,
    required this.title,
    required this.shortDesc,
    required this.collectionValue,
    required this.totalValue,
    required this.imageUrl,
    required this.recors,
    required this.onTap,
    required this.onPress,
  });

  final String title;
  final String shortDesc;
  final int collectionValue;
  final int totalValue;
  final String imageUrl;
  final int recors;
  final Function() onTap;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: Color(0xFF5BB0F5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\u{20B9}  $collectionValue',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                        Text(
                          'FOUNDED',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\u{20B9}  $totalValue',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                        Text(
                          'GOALS',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$recors',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                        Text(
                          'ENDS IN',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: onPress,
                      child: const Text('PLEDGE'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
          Positioned(
            left: 4,
            bottom: 200,
            child: Row(
              children: [
                Container(
                  width: 300,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                onPressed: onTap,
                                icon: const Icon(Icons.heart_broken),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            shortDesc,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const CircleAvatar(
                  backgroundColor: Color(0xFF012F55),
                  radius: 40,
                  child: Center(
                    child: Text(
                      '100%',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Stack(
      //   children: [
      //     Positioned.fill(
      //       child: Image.network(
      //         imageUrl,
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         const SizedBox(
      //           height: 280,
      //         ),
      //         Padding(
      //           padding:
      //               const EdgeInsets.symmetric(horizontal: 4, vertical: 100),
      //           child: Container(
      //             width: 300,
      //             child: Card(
      //               child: Padding(
      //                 padding: const EdgeInsets.symmetric(
      //                     horizontal: 10, vertical: 8),
      //                 child: Column(
      //                   children: [
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text(
      //                           title,
      //                           overflow: TextOverflow.ellipsis,
      //                           maxLines: 2,
      //                           style: Theme.of(context)
      //                               .textTheme
      //                               .bodyLarge!
      //                               .copyWith(fontWeight: FontWeight.bold),
      //                         ),
      //                         IconButton(
      //                           onPressed: onTap,
      //                           icon: const Icon(Icons.heart_broken),
      //                         ),
      //                       ],
      //                     ),
      //                     const SizedBox(height: 10),
      //                     Text(
      //                       shortDesc,
      //                       style: Theme.of(context)
      //                           .textTheme
      //                           .bodyLarge!
      //                           .copyWith(fontWeight: FontWeight.bold),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}

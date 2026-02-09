import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShowFilterReviews extends StatefulWidget {
  const ShowFilterReviews({super.key, this.initialQuery});

  final Map<String, dynamic>? initialQuery;

  @override
  State<ShowFilterReviews> createState() => _ShowFilterReviewsState();
}

class _ShowFilterReviewsState extends State<ShowFilterReviews> {
  late Map<String, dynamic> query;

  @override
  void initState() {
    super.initState();
    query = {
      'rating': widget.initialQuery?['rating'],
      'cardinal': widget.initialQuery?['cardinal'],
      'sortBy': widget.initialQuery?['sortBy'] ?? 'recent',
      'sortDir': widget.initialQuery?['sortDir'] ?? 'desc',
    };
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter reviews',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.left,
                ),
                GestureDetector(
                  onTap: context.pop,
                  child: const Icon(
                    Icons.clear,
                    color: TColors.secondary,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 15,
                    children: [
                      ...['Any', 5, 4, 3, 2, 1].asMap().entries.map(
                        (filter) {
                          final text = filter.value;
                          final index = filter.key;
                          return FilterChip(
                            label: Row(
                              spacing: 5,
                              children: [
                                Text(text.toString()),
                                if (index > 0)
                                  Text(index == 5 ? 'star' : 'stars'),
                              ],
                            ),
                            selected: query['rating'] != null
                                ? query['rating'] ==
                                      (index == 0
                                          ? null
                                          : (text as int).toDouble())
                                : index == 0,
                            onSelected: (value) {
                              setState(() {
                                if (index == 0) {
                                  query['rating'] = null;
                                } else {
                                  query['rating'] = (text as int).toDouble();
                                }
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                if (query['rating'] != null)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 15,
                      children: [
                        ...[
                          'Any',
                          'Location',
                          'Description',
                          'Attachments',
                          'Category',
                          'Funding',
                          'Dates',
                        ].asMap().entries.map(
                          (filter) {
                            final text = filter.value;
                            final index = filter.key;
                            return FilterChip(
                              label: Text(text),
                              selected: query['cardinal'] != null
                                  ? query['cardinal'] ==
                                        (index == 0 ? null : text)
                                  : index == 0,
                              onSelected: (value) {
                                setState(() {
                                  if (index == 0) {
                                    query['cardinal'] = null;
                                  } else {
                                    query['cardinal'] = text;
                                  }
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(
                          'Most recent',
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        onTap: () {
                          setState(() {
                            query['sortBy'] = 'recent';
                          });
                        },
                        contentPadding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                        trailing: SizedBox(
                          width: 20,
                          height: 24,
                          child: RadioGroup<String>(
                            groupValue: query['sortBy'] as String,
                            onChanged: (value) {
                              setState(() {
                                query['sortBy'] = value;
                              });
                            },
                            child: const Radio(
                              value: 'recent',
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        indent: 3,
                        endIndent: 3,
                      ),
                      ListTile(
                        title: Text(
                          'Most liked',
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),

                        onTap: () {
                          setState(() {
                            query['sortBy'] = 'liked';
                          });
                        },
                        contentPadding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                        trailing: SizedBox(
                          width: 20,
                          height: 24,
                          child: RadioGroup<String>(
                            groupValue: query['sortBy'] as String,
                            onChanged: (value) {
                              setState(() {
                                query['sortBy'] = value;
                              });
                            },
                            child: const Radio(
                              value: 'liked',
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        indent: 3,
                        endIndent: 3,
                      ),
                      ListTile(
                        title: Text(
                          'Most disliked',
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        onTap: () {
                          setState(() {
                            query['sortBy'] = 'disliked';
                          });
                        },
                        contentPadding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                        trailing: SizedBox(
                          width: 20,
                          height: 24,
                          child: RadioGroup<String>(
                            groupValue: query['sortBy'] as String,
                            onChanged: (value) {
                              setState(() {
                                query['sortBy'] = value;
                              });
                            },
                            child: const Radio(
                              value: 'disliked',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(
                          'Arrange ascending',
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        onTap: () {
                          setState(() {
                            query['sortDir'] = 'asc';
                          });
                        },
                        contentPadding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                        trailing: SizedBox(
                          width: 20,
                          height: 24,
                          child: RadioGroup<String>(
                            groupValue: query['sortDir'] as String,
                            onChanged: (value) {
                              setState(() {
                                query['sortDir'] = value;
                              });
                            },
                            child: const Radio(
                              value: 'asc',
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        indent: 3,
                        endIndent: 3,
                      ),
                      ListTile(
                        title: Text(
                          'Arrange descending',
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        onTap: () {
                          setState(() {
                            query['sortDir'] = 'desc';
                          });
                        }, 
                        contentPadding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                        trailing: SizedBox(
                          width: 20,
                          height: 24,
                          child: RadioGroup<String>(
                            groupValue: query['sortDir'] as String,
                            onChanged: (value) {
                              setState(() {
                                query['sortDir'] = value;
                              });
                            },
                            child: const Radio(
                              value: 'desc',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppDualButton(
                  onTapSkipButton: () {
                    setState(() {
                      query = {
                        'rating': null,
                        'cardinal': null,
                        'sortBy': 'recent',
                        'sortDir': 'desc',
                      };
                    });
                    context.pop(query);
                  },
                  activeButtonText: 'Apply filter',
                  onTapActiveButton: () {
                    context.pop(query);
                  },
                  activeButtonLoading: false,
                  skipButtonLoading: false,
                  skipText: 'Clear filter',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

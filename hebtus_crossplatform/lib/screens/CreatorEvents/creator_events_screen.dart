import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/screens/all_screens.dart';

import 'package:hebtus_crossplatform/services/creator_service.dart';
import '../../models/creator_events.dart';
import 'components/creator_event_card.dart';
import 'components/filter_events_bttn.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CreatorEventsScreen extends StatefulWidget {
  const CreatorEventsScreen({super.key});

  @override
  State<CreatorEventsScreen> createState() => _CreatorEventsScreenState();
}

class _CreatorEventsScreenState extends State<CreatorEventsScreen> {
  List<CreatorEvent> events = [];
  //for pagination
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  final scrollController = ScrollController();
  int currentPage = 1;
  final int pageLimit = 5;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    fetchEvents();
  }

  void _scrollListener() async {
    if (isLoading) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });
      await fetchEvents();
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<bool> fetchEvents() async {
    CreatorService creatorService = CreatorService();

    try {
      final newEvents = await creatorService.getMultipleEvents(
          csv: false, limit: pageLimit, page: currentPage);
      events.addAll(newEvents);
      setState(() {});
      print(events);
      currentPage++;

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: appBarModule(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: SizedBox(
            width: mediaQuery.size.width * 0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text("Hey There,",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FilterEventsBttn(),
                ),
                Container(
                  constraints:
                      BoxConstraints(maxHeight: mediaQuery.size.height * 0.7),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        itemBuilder: ((context, index) {
                          if (index < events.length) {
                            return CreatorEventCard(event: events[index]);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 1),
                        itemCount:
                            isLoading ? events.length + 1 : events.length),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

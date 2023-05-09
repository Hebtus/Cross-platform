import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';

import '../../../components/app_bar.dart';
import '../../../current_user.dart';
import '../../../models/attendee_event.dart';
import '../../../services/attendee_service.dart';
import 'event_list.dart';

CurrentUser currentUser = CurrentUser();

///page that contains a list of all events from the selected filter in the main page, it is paginated
class SeeMore extends StatefulWidget {
  final String? categ;
  final String? isonline;
  final String? isfree;
  final String? start;
  final String? end;
  const SeeMore(
      {required this.categ,
      required this.isonline,
      required this.isfree,
      required this.start,
      required this.end,
      super.key});

  @override
  State<SeeMore> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  final scrollController = ScrollController();
  int currentPage = 1;
  final int pageLimit = 8;
  List<AttendeeEvent> events = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    fetchEvents();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  Future<void> _scrollListener() async {
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
    AttendeeService attendeeService = AttendeeService();

    try {
      print(latitude_v);
      print(longitude_v);
      print(widget.categ);
      print(widget.isonline);
      print(widget.isfree);
      print(widget.start);
      print(widget.end);
      /*if(widget.categ!=null && widget.isonline==null && widget.isfree ==null && widget.start==null && widget.end==null)
      {
        print("hhhhh");
         final newEvents =
          await attendeeService.getEvents(limit: pageLimit, page: currentPage,latitude: latitude_v,
          longitude: longitude_v,category: widget.categ);
      events.addAll(newEvents);
      }
      else if (widget.categ==null && widget.isonline!=null && widget.isfree ==null && widget.start==null && widget.end==null)
      {
         final newEvents =
          await attendeeService.getEvents(limit: pageLimit, page: currentPage,latitude: latitude_v,
          longitude: longitude_v,online: bool.fromEnvironment(widget.isonline!,defaultValue: false));
      events.addAll(newEvents);
      }
       else if (widget.categ==null && widget.isonline==null && widget.isfree !=null && widget.start==null && widget.end==null)
      {
         final newEvents =
          await attendeeService.getEvents(limit: pageLimit, page: currentPage,latitude: latitude_v,
          longitude: longitude_v,free: bool.fromEnvironment(widget.isfree!,defaultValue: false));
      events.addAll(newEvents);
      }
       else if (widget.categ==null && widget.isonline==null && widget.isfree==null && widget.start!=null && widget.end!=null)
      {
         final newEvents =
          await attendeeService.getEvents(limit: pageLimit, page: currentPage,latitude: latitude_v,
          longitude: longitude_v,startDate: DateTime.parse(widget.start!) , endDate: DateTime.parse(widget.end!));
      events.addAll(newEvents);
      }
*/
      print("hjhjh");
      print(widget.isfree);

      final newEvents = await attendeeService.getEvents(
          limit: pageLimit,
          page: currentPage,
          latitude: latitude_v,
          longitude: longitude_v,
          category: widget.categ == "null" ? null : widget.categ,
          online: widget.isonline != "null"
              ? bool.fromEnvironment(widget.isonline!)
              : null,
          free: widget.isfree != "null"
              ? bool.fromEnvironment(widget.isfree!)
              : null,
          startDate:
              widget.start != null ? DateTime.tryParse(widget.start!) : null,
          endDate: widget.end != null ? DateTime.tryParse(widget.end!) : null);
      events.addAll(newEvents);
      setState(() {});
      currentPage++;
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(context),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 1),
        itemCount: isLoading ? events.length + 1 : events.length,
        padding: EdgeInsets.all(12),
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < events.length) {
            return Card(
              clipBehavior: Clip.hardEdge,
              color: const Color.fromARGB(255, 255, 249, 249),
              child: InkWell(
                splashColor: const Color.fromARGB(255, 250, 195, 188),
                onTap: () {
                  if (currentUser.isLoggedIn == true) {
                    return context.go("/events/${events[index].eventID}");
                  } else {
                    return context.go("/");
                  }
                },
                child: ListTile(
                  leading: SizedBox(
                    width: 100,
                    child: events[index].imgURL != ""
                        ? Image(
                            image: NetworkImage(events[index].imgURL),
                          )
                        : Container(),
                  ),
                  title: Text(events[index].eventName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(events[index].startTime.toString()),
                      Text(events[index].endTime.toString()),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/base/controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'dart:async'; // For the Timer

class HomeViewPage extends GetView<HomeController> {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator()); // Loading indicator
        }
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildWelcomeSection(),
                  const SizedBox(height: 100),
                  _buildFundsSection(),
                  const SizedBox(height: 10),
                  _buildFundCards(),
                ],
              ),
            ),
            _buildInvestedAmountContainer(),
          ],
        );
      }),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xFFFF8242),
      elevation: 0,
      leading: const Icon(Icons.menu, color: Colors.white),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color(0xFFFF8242),
      height: 200,
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome back",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          SizedBox(height: 10),
          Text(
            "Ayush",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFundsSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Your Funds",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            "View All",
            style: TextStyle(color: Color(0xFFFF8242), fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildFundCards() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 129, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.groupInvestments.length,
              itemBuilder: (context, index) {
                final group = controller.groupInvestments[index];
                final daysLeft =
                    group.getDaysLeft(); // Get the calculated days left
                return FundCard(
                  title: group.group_name,
                  date: group.investment_date,
                  daysLeft: daysLeft > 0 ? "$daysLeft Days Left" : "Expired",
                  // Show "Expired" if the date is passed
                  startTime: group.start_time,
                  countDown: group.countdownTimer,
                  icon: Icons.trending_up,
                );
              },
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Get.find<AuthController>().clearAuth();
            },
            child: const Text("Logout")),
      ],
    );
  }

  Widget _buildInvestedAmountContainer() {
    return Positioned(
      top: 150,
      left: 20,
      right: 20,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInvestedAmountText(),
                _buildTotalBorrowedText(),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProfitText(),
                _buildPercentageText(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvestedAmountText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Invested Amount",
            style: TextStyle(color: Colors.black54, fontSize: 14)),
        const SizedBox(height: 5),
        Obx(() => Text("₹${controller.investedAmount}",
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF555555)))),
      ],
    );
  }

  Widget _buildTotalBorrowedText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Total Borrowed",
            style: TextStyle(color: Colors.black54, fontSize: 14)),
        const SizedBox(height: 5),
        Obx(() => Text("₹${controller.totalBorrowed}",
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF555555)))),
      ],
    );
  }

  Widget _buildProfitText() {
    return Obx(() => Text("Profit Amount  +₹${controller.profitAmount}",
        style: const TextStyle(color: Color(0xFF555555), fontSize: 16)));
  }

  Widget _buildPercentageText() {
    return Row(
      children: [
        const Icon(
          Icons.trending_up,
          color: Color(0xFF07A702),
          size: 35,
        ),
        Obx(() => Text("${controller.increasePercentage}% increase",
            style: const TextStyle(color: Color(0xFF07A702), fontSize: 18))),
      ],
    );
  }
}

// FundCard component to reuse
class FundCard extends StatelessWidget {
  final String title;
  final String date;
  final String daysLeft;
  final String startTime; // Assuming this is just the time
  final IconData icon;
  final Timer? countDown;

  const FundCard({
    super.key,
    required this.title,
    required this.date,
    required this.startTime, // Only the time
    required this.daysLeft,
    required this.icon,
    required this.countDown,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 260,
      height: 120,
      padding: const EdgeInsets.all(15),
      //color: Color(0xFFFF8242),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0E5).withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFFFE5CF)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 18,
                  ),
                ),
              ),
              Icon(icon, size: 30, color: const Color(0xFFFF8242)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Color(0xFFFFECE2)),
                      child: const Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: Color(0xFFFF8749),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        date,
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xFF6B7280)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        startTime, // Display only time
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xFF6B7280)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFECE2),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.access_time_outlined,
                      size: 14, color: Color(0xFFFF8749))),
              const SizedBox(width: 5),
              Text(
                daysLeft, // Pass the days left string here
                style: const TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 253, 147, 65),
                      // First color of the gradient
                      Color(0xFFFF8242),
                      Color.fromARGB(255, 253, 147, 65),
                      // Second color of the gradient (you can change this color)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: const Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.hourglass_bottom,
                        color: Colors.white,
                        size: 16,
                      ),
                      Text(
                        "10:07:12",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class GroupInvestment {
  final String group_name;
  final String investment_date; // Assuming it's in 'dd MMM yyyy' format
  final String start_time;
  final String end_time;
  Timer? countdownTimer;

  GroupInvestment({
    required this.group_name,
    required this.investment_date,
    required this.start_time,
    required this.end_time,
  });

  factory GroupInvestment.fromJson(Map<String, dynamic> json) {
    // Logging the parsed values
    print('Parsing GroupInvestment from JSON...');
    print('Group Name: ${json['group_name'] as String}');
    print('Investment Date: ${json['investment_date'] as String}');
    print('Start Time: ${json['start_time'] as String}');
    print('End Time: ${json['end_time'] as String}');

    return GroupInvestment(
      group_name: json['group_name'] as String,
      investment_date: json['investment_date'] as String,
      start_time: json['start_time'] as String,
      end_time: json['end_time'] as String,
    );
  }

  // Helper method to calculate days left
  int getDaysLeft() {
    try {
      DateTime today = DateTime.now();

      // Parse the date using only the date part, ignoring the time
      DateTime investDate =
          DateFormat('MMM dd, yyyy').parse(investment_date.split(' at')[0]);

      // Calculate the difference in days between the investment date and today
      Duration diff = investDate.difference(today);

      return diff.inDays;
    } catch (e) {
      print('Error parsing date: $e');
      return 0; // Default to 0 if parsing fails
    }
  }

  // Method to start the timer

  // Start the countdown timer
  void startTimer() {
    if (countdownTimer != null && countdownTimer!.isActive) {
      countdownTimer!.cancel(); // Cancel previous timer if active
    }

    DateTime startDateTime = DateTime.parse(start_time);
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      Duration remaining = startDateTime.difference(now);

      // Logic to check if time is up
      if (remaining.isNegative) {
        countdownTimer!.cancel();
        // Handle timer expiration
      } else {
        // Update the UI with the remaining time
      }
    });
  }
}

//
// class StartCounter extends StatefulWidget {
//
//   final int startTime; // The time to count up to in seconds
//
//   StartCounter({required this.startTime});
//
//   @override
//   _StartCounterState createState() => _StartCounterState();
//
// }
//
// class _StartCounterState extends State<StartCounter> {
//   late Timer _timer;
//   int _elapsedTime = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }
//
//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_elapsedTime < widget.startTime) {
//           _elapsedTime++;
//         } else {
//           _timer.cancel(); // Stop the timer once the start time is reached
//         }
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Text(
//             'Elapsed Time: $_elapsedTime seconds',
//             style: TextStyle(fontSize: 24),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

// Bottom Navigation Bar
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class ListRoutes {
  static List<String> routes = [
    Routes.HOME,
    Routes.ALL_GROUPS,
    Routes.CREATE_GROUP,
    Routes.NOTIFICATION,
    Routes.CREATE_GROUP,
  ];
  static int currentIndex = 0;
}

class _BottomNavBarState extends State<BottomNavBar> {
  final bool _showLabels = false;

  void _onItemTapped(int index) {
    setState(() {
      ListRoutes.currentIndex = index;

      // _showLabels = true;
    });
    Get.toNamed(ListRoutes.routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), // Adjust top-left radius
          topRight: Radius.circular(20), // Adjust top-right radius
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, -4), // Shadow position
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined, size: 32),
            label: _showLabels && ListRoutes.currentIndex == 0 ? 'Home' : '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.groups_outlined, size: 32),
            label: _showLabels && ListRoutes.currentIndex == 1 ? 'Groups' : '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 70,
              height: 50,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 236, 143, 4),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 36,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications_none_outlined, size: 32),
            label: _showLabels && ListRoutes.currentIndex == 3
                ? 'Notifications'
                : '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_3_outlined, size: 32),
            label: _showLabels && ListRoutes.currentIndex == 4 ? 'Profile' : '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 236, 143, 4),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: ListRoutes.currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:praktikum_1/constants/color_constant.dart';
import 'package:praktikum_1/constants/text_style_constant.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.primaryBlue,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                            child: Text(
                              "Welcome,",
                              style: TextStyleConstant.poppins_medium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Text(
                              "Yusron Rizky Putra 👋",
                              style: TextStyleConstant.poppins24.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff525252),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 36, right: 30),
                        child: Image.asset('assets/images/profile.png'),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      width: double.infinity,
                      height: 170,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/top_container.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "My Savings",
                            style: TextStyleConstant.poppins_paragraph.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Rp. 10.430.000",
                            style: TextStyleConstant.poppins24.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          const SizedBox(
                            width: 224,
                            child: LinearProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xff102693),
                              ),
                              value: 0.4,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Rp. 10.430.000 / Rp. 40.000.000",
                            style: TextStyleConstant.poppins_medium.copyWith(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 145,
                        height: 60,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xff2C2C2C),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/save_money.png', scale: 5),
                              const SizedBox(width: 5),
                              Text(
                                'Save Money',
                                style: TextStyleConstant.poppins_medium.copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 25),
                      SizedBox(
                        width: 145,
                        height: 60,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xff2C2C2C),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/pay.png', scale: 5),
                              const SizedBox(width: 5),
                              Text(
                                'Pay',
                                style: TextStyleConstant.poppins_medium.copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 400), // Placeholder to ensure space for bottom sheet
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.3,
                minChildSize: 0.1,
                maxChildSize: 0.9,
                builder: (context, scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          height: 4,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Transactions History',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(
                                  index % 2 == 0 ? Icons.arrow_upward : Icons.arrow_downward,
                                  color: index % 2 == 0 ? Colors.green : Colors.red,
                                ),
                                title: Text(
                                  index % 2 == 0 ? 'Success!' : 'Starbucks Drinks',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text('February ${index + 1}, 12:25 PM', style: const TextStyle(color: Colors.grey),),
                                trailing: Text(
                                  index % 2 == 0 ? '+ 100.000' : '- 110.000',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: index % 2 == 0 ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

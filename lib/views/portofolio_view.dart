import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:praktikum_1/constants/color_constant.dart';
import 'package:praktikum_1/constants/text_style_constant.dart';

class PortofolioView extends StatelessWidget {
  const PortofolioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25),
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
              image: const DecorationImage(
                image: AssetImage('assets/images/top_container-2.png'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset.fromDirection(2),
                )
              ],
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Text(
                    'My Portfolio',
                    style: TextStyleConstant.poppins24.copyWith(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Savings Value',
                    style: TextStyleConstant.poppins_paragraph.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Rp 12.480.000',
                    style: TextStyleConstant.poppins24.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          portofolioWidget(
            'assets/images/work.png',
            'Pension savings funds',
            0.3,
            'Rp. 10.430.000 / Rp. 40.000.000',
            'Last saving February 19',
          ),
          portofolioWidget(
            'assets/images/camera.png',
            'Camera',
            0.5,
            'Rp. 2.050.000 / Rp. 4.000.000',
            'Last saving February 16',
          ),
          portofolioWidget(
            'assets/images/camera.png',
            'Camera',
            0.5,
            'Rp. 2.050.000 / Rp. 4.000.000',
            'Last saving February 16',
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            child: TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 13,
                    color: Colors.blue,
                  ),
                  Text(
                    'add portfolio',
                  )
                ],
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                elevation: 4,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget portofolioWidget(
    String icon,
    String title,
    double percent,
    String amount,
    String time,
  ) {
    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 20,
      ),
      padding: const EdgeInsets.fromLTRB(15, 19, 15, 14),
      constraints: const BoxConstraints.expand(
        height: 130,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset.fromDirection(1, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            child: CircleAvatar(
              backgroundColor: ColorConstant.primaryBlue,
              child: Image.asset(
                icon,
                width: 24,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyleConstant.poppins_medium.copyWith(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                const SizedBox(
                  height: 12,
                ),
                LinearPercentIndicator(
                  lineHeight: 4,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  percent: percent,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.grey.withOpacity(0.3),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  amount,
                  style: TextStyleConstant.poppins_medium.copyWith(color: const Color(0xff888888)),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    time,
                    style: TextStyleConstant.poppins_medium.copyWith(color: const Color(0xffCBCBCB)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
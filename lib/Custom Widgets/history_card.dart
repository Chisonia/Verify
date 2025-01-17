import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.title,
    required this.isVerified, required this.subTitle, required this.subTitle1, required this.subTitle2, required this.subTitle3, required this.image,
  });

  final String title;
  final String subTitle;
  final String subTitle1;
  final String subTitle2;
  final String subTitle3;
  final bool isVerified;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isVerified 
                  ? SizedBox(
                    width: 94,
                    height: 26,
                    child: Image.asset('assets/icons/isVerified.png'),
                )
                  : SizedBox(
                    width: 94,
                    height: 26,
                    child: Image.asset('assets/icons/notVerified.png'),
                ),
              const SizedBox(height: 8),
              image
            ],
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 2),
                SizedBox(
                  width: 190,
                  child: Text(
                      subTitle,
                      style: Theme.of(context).textTheme.titleSmall
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Verification Date',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                    subTitle1,
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 4),
                Text(
                  'Verification Method',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                    subTitle2,
                    style: Theme.of(context).textTheme.titleSmall),
                Text(
                  'NAFDAC NUMBER',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                    subTitle3,
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


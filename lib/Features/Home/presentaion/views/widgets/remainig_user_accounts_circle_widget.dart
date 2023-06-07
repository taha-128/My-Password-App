import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_password/Core/utils/styles.dart';
import 'package:my_password/Features/Home/presentaion/cubit/home_cubit.dart';
import 'package:my_password/constants.dart';
import 'package:percentify/components/RectCircularPercentify.dart';

class RemainingUserAccountsCircleWidget extends StatelessWidget {
  const RemainingUserAccountsCircleWidget({
    super.key,
    required this.usageSpace,
    required this.userSpace,
  });
  final int usageSpace;
  final int userSpace;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        double percent = usageSpace / userSpace * 100;
        return SizedBox(
          width: MediaQuery.of(context).size.width * .25,
          height: MediaQuery.of(context).size.height * .25,
          child: RectCircularPercentify(
            percent,
            backgroundColor: MyColors.kLightYellow,
            valueColor: MyColors.kOrange,
            strokeWidth: 18,
            valueStrokeWidth: 18,
            child: Center(
              child: Text(
                '${percent.toInt()}%',
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


import 'package:bmi_calculator/assets/constants.dart';
import 'package:flutter/Material.dart';

class HeightSelector extends StatefulWidget {
  HeightSelector({super.key, required this.height});
  int? height;

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'HEIGHT',
            style: kGenderLabelTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                widget.height.toString(),
                style: kNumberTextStyle,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'CM',
                style: kGenderLabelTextStyle,
              )
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                thumbColor: const Color(0xFFEB1555),
                inactiveTrackColor: const Color(0xFF8D8E98),
                activeTrackColor: Colors.white,
                overlayColor: const Color(0x29EB1555),
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 24)),
            child: Slider(
                value: widget.height!.toDouble(),
                min: 120.0,
                max: 220.0,
                onChanged: (double newValue) {
                  setState(() {
                    widget.height = newValue.round();
                  });
                }),
          ),
        ],
      ),
    );
  }
}

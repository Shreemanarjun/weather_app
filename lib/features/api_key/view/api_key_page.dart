import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/core/router/router.gr.dart';
import 'package:weather_app/shared/pods/api_key_pod.dart';

@RoutePage(
  deferredLoading: true,
)
class ApiKeyPage extends ConsumerStatefulWidget {
  const ApiKeyPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ApiKeyPage> createState() => _ApiKeyPageState();
}

class _ApiKeyPageState extends ConsumerState<ApiKeyPage> {
  final textcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final value = ref.read(apiKeyPod);
    textcontroller.value = TextEditingValue(text: value);
  }

  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Set your API key".text.make(),
      ),
      body: <Widget>[
        TextField(
          controller: textcontroller,
          decoration: const InputDecoration(hintText: 'Enter api key'),
        ),
        ElevatedButton(
          onPressed: () {
            if (textcontroller.value.text.isNotEmpty) {
              ref
                  .read(apiKeyPod.notifier)
                  .update((state) => textcontroller.value.text);
            }
            context.navigateTo(const WeatherRoute());
          },
          child: "Set key".text.make(),
        ).p8()
      ]
          .vStack(
            alignment: MainAxisAlignment.center,
          )
          .p8(),
    );
  }
}

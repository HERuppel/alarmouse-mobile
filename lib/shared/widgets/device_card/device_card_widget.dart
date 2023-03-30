import 'package:flutter/material.dart';
import 'package:mobile/shared/models/Device/device_model.dart';
import 'package:mobile/shared/themes/app_text_styles.dart';

class DeviceCardWidget extends StatefulWidget {
  final Device device;
  final VoidCallback onTap;
  const DeviceCardWidget(
      {super.key, required this.device, required this.onTap});

  @override
  State<DeviceCardWidget> createState() => _DeviceCardWidgetState();
}

class _DeviceCardWidgetState extends State<DeviceCardWidget> {
  String _getDeviceOwnership(String role) =>
      role == 'DEVICE_OWNER' ? 'Proprietário' : 'Convidado';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Ink(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.device.nickname,
                      style: TextStyles.deviceCardName),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Estado: ", style: TextStyles.deviceStatusSub),
                    TextSpan(
                        text: widget.device.status,
                        style: TextStyles.deviceCardStatus)
                  ])),
                  Text(_getDeviceOwnership(widget.device.role),
                      style: TextStyles.deviceCardOwnership),
                ],
              ),
              widget.device.status != 'Desconfigurado'
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon:
                                const Icon(Icons.power_settings_new, size: 50))
                      ],
                    )
                  : const SizedBox()
            ],
          )),
    );
  }
}

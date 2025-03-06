import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_malina/constants/constants.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen>
    with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    detectionSpeed:
        DetectionSpeed.noDuplicates, // предотвращает дублирующиеся сканирования
    facing: CameraFacing.back, // используем заднюю камеру
    torchEnabled: false, // начально фонарик выключен
  );

  StreamSubscription<Object?>? _subscription;
  String scanResult = "Сканируйте QR-код";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _subscription = controller.barcodes.listen(_handleBarcode);
    unawaited(controller.start());
  }

  void _handleBarcode(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty) {
      setState(() {
        scanResult = barcodes.first.rawValue ?? "Ошибка чтения";
      });
      debugPrint("QR-код найден: ${barcodes.first.rawValue}");
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!controller.value.isRunning) return;

    switch (state) {
      case AppLifecycleState.resumed:
        _subscription = controller.barcodes.listen(_handleBarcode);
        unawaited(controller.start());
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
      case AppLifecycleState.detached:
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(controller.stop());
        break;
    }
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    _subscription = null;
    super.dispose();
    await controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final leftRight = width / 8;
    final topBottom = (height - (width - (leftRight * 2))) / 2;
    return Scaffold(
      //appBar: AppBar(title: const Text("QR Scanner")),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                  flex: 4,
                  child: Image.asset(
                    'assets/menu/image1.png',
                    fit: BoxFit.cover,
                  )
                  /*  MobileScanner(
                  controller: controller,
                ), */
                  ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text("Результат: $scanResult",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ),
              ),
            ],
          ),

          //Top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: topBottom,
              width: double.infinity,
              color: MColor.black.withOpacity(0.4),
            ),
          ),
          // Left
          Positioned(
            top: topBottom,
            left: 0,
            bottom: topBottom,
            child: Container(
              width: leftRight,
              color: MColor.black.withOpacity(0.4),
            ),
          ),
          //bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: topBottom,
              width: double.infinity,
              color: MColor.black.withOpacity(0.4),
            ),
          ),
          //Right
          Positioned(
            top: topBottom,
            right: 0,
            bottom: topBottom,
            child: Container(
              width: leftRight,
              color: MColor.black.withOpacity(0.4),
            ),
          ),
          Positioned(
            top: topBottom - 40,
            child: Text(
              'Поместите QR-код в рамку',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                fontSize: 18,
                height: 21.48 / 18,
                color: MColor.white,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top,
            right: 16.98,
            child: GestureDetector(
              onTap: () => Go.back(context),
              child: Icon(
                Icons.close,
                size: 30,
                color: Color(0xFF777777),
              ),
            ),
          )
        ],
      ),
    );
  }
}

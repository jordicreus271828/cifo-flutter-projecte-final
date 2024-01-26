import 'package:compulsilina/development.dart';
import 'package:compulsilina/pages/treatment_page.dart';
import 'package:compulsilina/styles/styles.dart';
import 'package:compulsilina/tools/custom_navigator.dart';
import 'package:flutter/material.dart';

import '../widgets/large_button_widget.dart';
import '../widgets/message_widget.dart';
import '../widgets/page_widget.dart';
import '../widgets/section_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: "Compulsilina",
      body: SingleChildScrollView(
        child: Container(
          margin: AppStyles.bodyMargin,
          child: Column(
            children: [
              _myProgress(context),
              AppStyles.verticalSeparator,
              _messageOfTheDay(context),
              AppStyles.verticalSeparator,
              _mainMenu(context),
            ],
          ),
        ),
      ),
    );
  }

  SectionWidget _myProgress(BuildContext context) {
    return SectionWidget(
      title: "Mi progreso",
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text("Nivel"),
                  // Image(image: AssetImage('assets/images/179250.png')),
                  Image.asset(
                    'assets/images/179250.png',
                    height: AppStyles.imageHeight,
                    width: AppStyles.imageWidth,
                  ),
                  const Text("Medalla de bronce"),
                ],
              ),
              AppStyles.horizontalSeparator,
              Table(
                // border: TableBorder.all(color: Colors.black),
                defaultColumnWidth: const IntrinsicColumnWidth(),
                /*columnWidths: const {
                  0: IntrinsicColumnWidth(),
                  1: IntrinsicColumnWidth()
                },*/
                children: [
                  TableRow(
                    children: [
                      Container(
                        padding: AppStyles.tableCellPadding,
                        child: const Text("Constancia"),
                      ),
                      Container(
                        padding: AppStyles.tableCellPadding,
                        alignment: Alignment.centerRight,
                        child: const Text("82"),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: AppStyles.tableCellPadding,
                        child: const Text("Fuerza"),
                      ),
                      Container(
                        padding: AppStyles.tableCellPadding,
                        alignment: Alignment.centerRight,
                        child: const Text("19"),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: AppStyles.tableCellPadding,
                        child: const Text("Contribución"),
                      ),
                      Container(
                        padding: AppStyles.tableCellPadding,
                        alignment: Alignment.centerRight,
                        child: const Text("3"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          AppStyles.verticalSeparator,
          OutlinedButton(
            onPressed: () => Development.developmentDialog(context),
            child: const Text("Detalles"),
          ),
        ],
      ),
    );
  }

  SectionWidget _messageOfTheDay(BuildContext context) {
    return SectionWidget(
      title: "Mensaje del día",
      content: Column(
        children: [
          const MessageWidget(text: Development.loremIpsum25),
          AppStyles.verticalSeparator,
          OutlinedButton(
            onPressed: () => Development.developmentDialog(context),
            child: const Text("Ver todos"),
          ),
        ],
      ),
    );
  }

  SectionWidget _mainMenu(BuildContext context) {
    return SectionWidget(
      title: "Menú principal",
      content: Column(
        children: [
          /*LargeButtonWidget(
            onPressed: () => CustomNavigator.push(context, const DevelopmentPage1()),
            text: "Development 1",
          ),
          AppStyles.verticalSeparator,
          LargeButtonWidget(
            onPressed: () => CustomNavigator.push(context, const DevelopmentPage2()),
            text: "Development 2",
          ),
          AppStyles.verticalSeparator,
          LargeButtonWidget(
            onPressed: () => CustomNavigator.push(context, const DevelopmentPage3()),
            text: "Development 3",
          ),
          AppStyles.verticalSeparator,*/
          LargeButtonWidget(
            onPressed: () => Development.developmentDialog(context),
            text: "Tests",
          ),
          AppStyles.verticalSeparator,
          LargeButtonWidget(
            onPressed: () =>
                CustomNavigator.push(context, const TreatmentPage()),
            text: "Mi tratamiento",
          ),
          AppStyles.verticalSeparator,
          LargeButtonWidget(
            onPressed: () => Development.developmentDialog(context),
            text: "Catálogo de ejercicios de EPR",
          ),
          AppStyles.verticalSeparator,
          LargeButtonWidget(
            onPressed: () => Development.developmentDialog(context),
            text: "Mi perfil",
          ),
          AppStyles.verticalSeparator,
          LargeButtonWidget(
            onPressed: () => Development.developmentDialog(context),
            text: "Configuración",
          ),
          AppStyles.verticalSeparator,
          LargeButtonWidget(
            onPressed: () => Development.developmentDialog(context),
            text: "Acerca de Compulsilina",
          ),
          AppStyles.verticalSeparator,
          LargeButtonWidget(
            onPressed: () => Development.developmentDialog(context),
            text: "Salir",
          ),
        ],
      ),
    );
  }
}

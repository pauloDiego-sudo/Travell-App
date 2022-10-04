import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trave_tutorial_app/cubit/app_cubits.dart';
import 'package:trave_tutorial_app/widgets/app_large_text.dart';
import 'package:trave_tutorial_app/widgets/app_text.dart';
import 'package:trave_tutorial_app/misc/colors.dart';
import 'package:trave_tutorial_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["welcome-one.png", "welcome-two.png", "welcome-three.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Viagem"),
                        AppText(
                          text: "Nas Montanhas",
                          size: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width:
                              250, //se o tamanho for maior que 250, vai pra outra linha
                          child: AppText(
                            text:
                                "Escalar montanhas gera uma indescritível sensação de liberdade no indivíduo, bem como aumenta a resistência física e mental.",
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context).getData();
                            },
                            child: Container(
                              width: 200,
                              child: Row(children: [
                                ResponsiveButton(
                                  width: 120,
                                )
                              ]),
                            )),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots
                              ? 25
                              : 8, // a altura dos pontos fica responsiva, assim, quando a pessoa rolar a tela pra baixo, os pontos vão aumentar de acordo com a tela que ela está, se o indice do ponto for o mesmo da imagem, então o ponto específico estará grande
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(
                                    0.3), //a cor também fica responsiva
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ), //colocando o texto na pagina inicial, bem formatado
            );
          }), //Com isso a gente pode rolar a tela pra cima e pra baixo a quantidade de imagens que coloquei
    );
  }
}

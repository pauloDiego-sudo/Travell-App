import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trave_tutorial_app/cubit/app_cubit_states.dart';
import 'package:trave_tutorial_app/cubit/app_cubits.dart';
import 'package:trave_tutorial_app/misc/colors.dart';
import 'package:trave_tutorial_app/widgets/app_buttons.dart';
import 'package:trave_tutorial_app/widgets/app_large_text.dart';
import 'package:trave_tutorial_app/widgets/app_text.dart';
import 'package:trave_tutorial_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              //imagem de montanha
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage("http://mark.bslmeiyu.com/uploads/" +
                        detail.places.img),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              //Informações de baixo
              Positioned(
                top: 250,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //nome e preço da viagem à montanha
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: detail.places.name,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          AppLargeText(
                            text: "\$" + detail.places.price.toString(),
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Localização
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(width: 5),
                          AppText(
                              text: detail.places.location,
                              color: AppColors.textColor1),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Estrelas de classificação
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(Icons.star,
                                  color: detail.places.stars >
                                          index // se a quantidade de estrelas recebidas for menor que o indice atual do ícone, então o próximo ícone de estrela muda de cor
                                      ? AppColors.starColor
                                      : AppColors.textColor2);
                            }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: "(5.0)",
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      AppLargeText(
                        text: "Pessoas",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AppText(
                          text: "Quantidade de pessoas no seu grupo",
                          color: AppColors.mainTextColor),
                      SizedBox(
                        height: 10,
                      ),
                      //botões pra selecionar quantidade de pessoas
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButtons(
                                    size: 50,
                                    //testa se o botão foi selecionado e muda a cor
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    text: (index + 1).toString(),
                                  )));
                        }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //Descrição
                      AppLargeText(
                        text: "Descrição",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      AppText(
                        text: detail.places.description,
                        color: AppColors.mainTextColor,
                      )
                    ],
                  ),
                ),
              ),
              //ícone do lado superior esquerdo
              Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              //Botões inferiores para selecionar a compra da viagem
              Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                      size: 60,
                      color: AppColors.textColor1,
                      backgroundColor: Colors.white,
                      borderColor: AppColors.textColor1,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ResponsiveButton(
                      isResponsive: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

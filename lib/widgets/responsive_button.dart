import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trave_tutorial_app/misc/colors.dart';
import 'package:trave_tutorial_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width = 120, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      width: isResponsive == true ? double.maxFinite : width,
      height: 60,
      decoration: BoxDecoration(
          //decorando o botão
          borderRadius: BorderRadius.circular(10), //borda circular raio 10
          color: AppColors.mainColor //cor que vem do arquivo cedido
          ),
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center, //centralizando a imagem do botão
        children: [
          isResponsive == true
              ? Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppText(text: "Reservar viagem", color: Colors.white))
              : Container(),
          Image.asset("img/button-one.png"), //adicionando o botão
        ],
      ),
    ));
  }
}

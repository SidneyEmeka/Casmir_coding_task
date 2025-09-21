import 'package:casmir/state/casmirx.dart';
import 'package:casmir/utils/buttonst.dart';
import 'package:casmir/utils/langlisttille.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  void _showLanguageSheet(BuildContext context) {
    showModalBottomSheet(context: context,
        builder: (BuildContext context){
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8,),
            Container(
              width: MediaQuery.of(context).size.width*0.15,
              height: 3,
              decoration: BoxDecoration(
                color:  const Color(0x1A7A5AF8),
                borderRadius: BorderRadius.circular(30)
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Select your preferred language",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.tertiary
                  ),),
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close,color: Theme.of(context).colorScheme.tertiary,size: 24,))
                ],
              ),
            ),
            const SizedBox(height: 15,),
            const Divider(
              color: Color(0x1A7A5AF8),height: 0.5,
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...Get.find<Casmirx>().allLanguages.map((l){
                      return  InkWell(
                          onTap: (){
                            Get.find<Casmirx>().selectedLang.value = l;
                            Navigator.pop(context);
                          },
                          child: Langlisttille(selected: l,));
                    })
                  ],
                ),
              ),
            ),

          ],
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //select language
              InkWell(
                onTap: ()=> _showLanguageSheet(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(()=> Text("${Get.find<Casmirx>().selectedLang}",style: Theme.of(context).textTheme.bodyMedium,),
                      ),
                      const SizedBox(width: 2,),
                      const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,size: 16,)
                    ],
                  ),
                ),
              ),
              const Spacer(),
              //other widgets
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                    width: size.width*0.8,
                    child: Text("Connect with\nyour community\nwherever you are",
                      style: Theme.of(context).textTheme.displayLarge,),),
              ),
              const SizedBox(height: 20,),
              //Oauths
              ButtonsT(buttonColor: Theme.of(context).colorScheme.primary, buttonText: "Continue with Apple ID", buttonIcon:  const Icon(Icons.apple,color: Colors.white,size: 16,)),
              const SizedBox(height: 8,),
              ButtonsT(buttonColor: Theme.of(context).colorScheme.secondary, buttonText: "Continue with Google", buttonIcon: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/google.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),),
              const SizedBox(height: 8,),
                const ButtonsT(buttonColor: Colors.transparent, buttonText: "Continue with E-mail", buttonIcon:  Icon(Icons.mail_outline_rounded,color: Colors.white,size: 16,)),
              const SizedBox(height: 20,),
              SizedBox(
                child: Text("By signing up, you accept the Terms of Use and Privacy Policy of how we process your data",
                style: Theme.of(context).textTheme.bodySmall,textAlign: TextAlign.center,),
              ),
          const SizedBox(height: 20,)
                ],
          ),
        ),
      ),
    );
  }
}

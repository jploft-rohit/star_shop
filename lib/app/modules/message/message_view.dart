import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/app_header.dart';
import '../../../common/color_constants.dart';
import '../../../common/utils.dart';
import '../../controller/message_controller.dart';

class MessageView extends GetView<MessageController>{
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: const AppHeader(
            showBackIcon: true,
            title: 'Chat',
          )),
      body: Column(
        children: [

         Container(
           margin: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
           padding: const EdgeInsets.all(20),
           decoration: BoxDecoration(
             color: ColorConstants.primaryColorLight,
             boxShadow: [getDeepBoxShadow()],
             borderRadius: getCurvedBorderRadius(),
             border: Border.all(color: ColorConstants.primaryColor)
           ),
           child: Row(
             children: [
               Expanded(child: Column(
                 children: [
                   buildInfoItems('Order ID', '#3635456'),
                   buildInfoItems('Order Total', '42 AED'),
                   buildInfoItems('Quantity', '4'),
                   buildInfoItems('Order Date', '10/08/2022'),
                 ],
               )),

               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                 decoration: BoxDecoration(
                   border: Border.all(color: ColorConstants.primaryColor),
                   borderRadius: getCurvedBorderRadius()
                 ), child: addText('RETURNED', getSmallestTextFontSIze(), ColorConstants.primaryColor, FontWeight.bold),
               )
             ],
           ),
         ),
          Expanded(child: buildChatList()),
          Row(
           children: [
             Container(
               width: 80.w,
               alignment: Alignment.center,
               margin: const EdgeInsets.symmetric(horizontal: 10),
               padding: const EdgeInsets.symmetric(
                   horizontal: 15, vertical: 2),
               decoration: BoxDecoration(
                   border: Border.all(
                       color: ColorConstants.lightGreyColor, width: 0.5),
                   color: ColorConstants.etBgColor,
                   borderRadius: getBorderRadiusCircular()),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [

                   const SizedBox(
                     width: 10,
                   ),
                   Expanded(
                       child: TextFormField(
                         maxLines: 100,
                         minLines: 1,
                         keyboardType: TextInputType.multiline,
                         controller: controller.chatController,
                         textInputAction: TextInputAction.done,
                         style: TextStyle(fontSize: getNormalTextFontSIze()),
                         decoration: InputDecoration(
                             hintText: 'Message'.tr,
                             prefixIcon: const Icon(
                               Icons.emoji_emotions_outlined,
                               color: Colors.grey,
                               size: 20,
                             ),
                             prefixIconConstraints: const BoxConstraints(maxHeight: 10,maxWidth: 10),
                             suffixIcon: Row(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 SvgPicture.asset("assets/icon/ic_attach.svg"),
                                 const SizedBox(width: 8),
                                 SvgPicture.asset("assets/icon/ic_mic.svg"),
                               ],
                             ),
                             hintStyle: TextStyle(
                                 fontSize: getNormalTextFontSIze(),
                                 color: ColorConstants.gretTextColor.withOpacity(0.8)),
                             contentPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                             border: InputBorder.none),
                       ),
                   ),

                 ],
               ),
             ),

             GestureDetector(
               onTap: () {
                 // if (controller.chatController.text.trim().isNotEmpty) {
                 //   controller.sendMessage(controller.vendorId, controller.chatController.text.trim());
                 // }
               },
               child: SvgPicture.asset(
                 'assets/images/send.svg',
                 width: 10.w,
               ),
             ),

             const SizedBox(width: 10,)

           ],

         ),
          const SizedBox(
            height: 10,
          ),

        ],
      ),
    );
  }



  Widget buildChatList(){
    return  Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        reverse: true,
        itemCount: controller.messages.length,
        // controller: controller.scrollController,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index){
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                    alignment: (controller.messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: controller.messages[index].messageType == "receiver" ? MainAxisAlignment.start : MainAxisAlignment.end,
                      children: [

                        const SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20),
                            boxShadow: [getDeepBoxShadow()],
                            color: (controller.messages[index].messageType  == "receiver"?ColorConstants.white:ColorConstants.primaryColorLight),
                            borderRadius: controller.messages[index].messageType  == "receiver"?
                            const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomRight: Radius.circular(20),):  const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(controller.messages[index].messageContent, style: TextStyle(fontSize: getNormalTextFontSIze()),),
                        ),
                        const SizedBox(width: 10,),
                      ],
                    )
                ),
              ),

              if(controller.messages[index].messageType == "receiver")
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: addText('3:30 PM', getSmallestTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal))),
              
              if(controller.messages[index].messageType != "receiver")
                Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: addText('3:30 PM', getSmallestTextFontSIze(), ColorConstants.gretTextColor, FontWeight.normal))),
            ],
          );
        },
      ),
    );
  }


}
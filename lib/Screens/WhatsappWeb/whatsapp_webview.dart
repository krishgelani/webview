import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WhatsAppWebView extends StatefulWidget {
  @override
  _WhatsAppWebViewState createState() => _WhatsAppWebViewState();
}

// .hblzrxh7 width = 0 , .s4r5ooj2 min-width = none;

class _WhatsAppWebViewState extends State<WhatsAppWebView> {
  late WebViewController controller;

  Future<bool> _exitApp(BuildContext context) async {
    if (await controller.canGoBack()) {
      print("::::::::::::::::::::onwill goback");
      controller.goBack();
      return Future.value(true);
    } else {
      print(" :::::::::::::::::::::  NOOOOO   onwill goback");

      return Future.value(false);
    }
  }

  @override
  void initState() {
    super.initState();
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    // pullToRefreshController = PullToRefreshController(
    //   options: PullToRefreshOptions(
    //     color: Colors.blue,
    //   ),
    //   onRefresh: () async {
    //     if (Platform.isAndroid) {
    //       webViewController?.reload();
    //     } else if (Platform.isIOS) {
    //       webViewController?.loadUrl(
    //           urlRequest: URLRequest(url: await webViewController?.getUrl()));
    //     }
    //   },
    // );

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFFFFFFF))
      ..setUserAgent(
          "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; en-US; rv:1.9.0.4) Gecko/20100101 Firefox/60.0")
      ..enableZoom(false)
      ..addJavaScriptChannel(
        'messageHandler',
        onMessageReceived: (JavaScriptMessage message) async {
          print("MESSAGE RECIVE ${message.message} ");
          if (message.message == 'ChatOpen') {
            var isBackBtnAvailable =
                await controller.runJavaScriptReturningResult('''
                isOnChatListScreen = false;
               
                !!document.querySelector("#main > header > button > svg");''');
            if (isBackBtnAvailable == false) {
              controller.runJavaScript('''
                  if(isOnChatListScreen == false){
                  isOnChatListScreen = true;
                  var newButton = document.createElement('button');
newButton.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 320 512" style="fill:white;stroke:white;stroke-width:5;fill-rule:evenodd;padding: 10px 15px 10px 5px;"><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l192 192c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256 246.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-192 192z" style=""></path></svg>';
document.querySelector("#main > Header ").insertBefore(newButton,document.querySelector("#main > Header ").firstChild);
newButton.addEventListener('click', () => {
 messageHandler.postMessage("back");
});
}
''');

              controller.runJavaScript('''
                var headerRowProfileImg = document.querySelector("#main > Header > ._2pr2H ");
headerRowProfileImg.addEventListener('click', () => {
 messageHandler.postMessage("headerProfile");
});  

   var headerRowTitle = document.querySelector("#main > Header > ._2au8k  ");
headerRowTitle.addEventListener('click', () => {
 messageHandler.postMessage("headerProfile");
});

   var headerRowSearchBtn = document.querySelector("#main > Header > ._1VwoK > div > ._3OtEr");
headerRowSearchBtn.addEventListener('click', () => {
 messageHandler.postMessage("headerProfile");
});

var headerRowSearchBtn = document.querySelector("#main > Header > ._1VwoK > div > ._3vsRF");
headerRowSearchBtn.addEventListener('click', () => {
 messageHandler.postMessage("headerProfileMenuShow");
});

''');
            }
//             var isGroupChat = await controller.runJavaScriptReturningResult(
//                 "!!document.querySelector('span._3FuDI.ajgl1lbb.edeob0r2._11JPr');");
//
//             if (isGroupChat == true) {
//               Timer.periodic(Duration(milliseconds: 1500), (timer) async {
//                 controller.runJavaScript(
//                     '''var elements = document.querySelectorAll('span._3FuDI.ajgl1lbb.edeob0r2._11JPr');
//
// // Now, you can iterate ovbser the elements if needed:
// elements.forEach(element => {
// element.addEventListener('click', () => {
//      messageHandler.postMessage("ProfileFromGroupChat");
// });
// });''');
//               });
//             }

            controller.runJavaScript(
                "document.getElementsByClassName('_2xAQV')[0].style.display = 'block';");
            controller.runJavaScript(
                "document.getElementsByClassName('_2xAQV')[1].style.display = 'block';");
            controller.runJavaScript(
                "document.getElementsByClassName('_3RGKj')[0].style.display = 'none';");
            controller.runJavaScript(
                "document.getElementsByClassName('_3RGKj')[1].style.display = 'none';");
          }

//           if (message.message == 'ProfileFromGroupChat') {
//             print(':::: Profile From Group Chat ::::');
//             controller.runJavaScript('''
//                 var profileFromChat = document.querySelector("#app > div > div > div._2Ts6i._1xFRo");
// profileFromChat.style.width = "100%";
// profileFromChat.style.maxWidth = "100%";
//
//
// var profileCloseButton = document.querySelector("#app > div > div > div._2Ts6i._1xFRo > span > div > span > div > header > div > div.kk3akd72.p6y6hbba > div");
// profileCloseButton.addEventListener('click', () => {
//
//  messageHandler.postMessage("profileBackToChat");
// });
// ''');
//           }
//           if (message.message == 'profileBackToChat') {
//             print(':::: Back to Chat From Profile ::::');
//             controller.runJavaScript('''
//             profileFromChat.style.width = "0%";
//             profileFromChat.style.maxWidth = "0%";
//                 ''');
//           }
          if (message.message == 'back') {
            print(":::: Chat Back Button ::::");
            controller.runJavaScript('isOnChatListScreen = true;');
            controller.runJavaScript(
                'document.querySelector("#main > Header > button").remove();');
            controller.runJavaScript(
                "document.getElementsByClassName('_2xAQV')[0].style.display = 'none';");
            controller.runJavaScript(
                "document.getElementsByClassName('_2xAQV')[1].style.display = 'none';");
            controller.runJavaScript(
                "document.getElementsByClassName('_3RGKj')[0].style.display = 'block';");
            controller.runJavaScript(
                "document.getElementsByClassName('_3RGKj')[1].style.display = 'block';");

            controller.runJavaScript(
                '''document.querySelectorAll('div.lhggkp7q.ln8gz9je.rx9719la').forEach(function(params) {
    params.onclick = function() {
        // Do something when the element is clicked
        console.log('Element clicked!');
        if(isOnChatListScreen == true){
        messageHandler.postMessage("ChatOpen");
        }
    };
});''');
          }
          if (message.message == 'status') {
            print(":::: Status Button Call ::::");
            controller.runJavaScript(
                '''var statusContentPart = document.querySelector("#app > div > span:nth-child(3) > div > span > div > div > div.lhggkp7q.qq0sjtgm.p357zi0d.f8m0rgwh.gndfcl4n.ac2vgrno.ppled2lx.r77w0ibt.l6bevpbc.f82bpul8.orypyu02.sv1r5vap.n0xp5siy.a21xwfzl.m2tbfq6e");
statusContentPart.style.display = 'none';

var statusList = document.querySelector("#app > div > span:nth-child(3) > div > span > div > div > div.lhggkp7q.qq0sjtgm.tkdu00h0.p357zi0d.f8m0rgwh.ppled2lx.bfsx6evv.hj24v2v0.i9ba79ay.jykept17.p7ivxbd6.o7f2woc0");
statusList.style.width = '100%';

''');
          }
//           if (message.message == 'headerProfile' && message.message != 'back') {
//             print(":::: header Click ::::");
//             controller.runJavaScript(
//                 '''var container = document.querySelector('div._2Ts6i._1xFRo');
// container.style.width = "100%";
// container.style.maxWidth = "100%";''');
//
//             controller.runJavaScript(
//                 '''var headerRowBack = document.querySelector('div.kk3akd72.svlsagor.fewfhwl7.ajgl1lbb.ltyqj8pj');
// headerRowBack.addEventListener('click', () => {
//  messageHandler.postMessage("headerProfileBack");
// });''');
//           }
//           if (message.message == 'headerProfileBack') {
//             print(":::: header Click Back ::::");
//             controller.runJavaScript(
//                 '''var container = document.querySelector('div._2Ts6i._1xFRo');
// container.style.width = "0";
// container.style.maxWidth = "0";''');
//           }

          if (message.message == "headerProfileMenuShow") {
            print(":::: Hearder Menu Option Click ::::");
            Future.delayed(const Duration(milliseconds: 700), () async {
              controller.runJavaScript(
                  '''var firstLi = document.querySelector('ul._3bcLp > div > div > li:first-child');
firstLi.addEventListener('click', () => {
 messageHandler.postMessage("headerProfile");
});''');
            });
          }

          if (message.message == "LogInTrue") {
            print(":::: log In True ::::");
            Future.delayed(const Duration(milliseconds: 100), () async {
              controller.runJavaScript('''
                    
// ::::::::::::: OBSERVER FOR CHAT OPEN ::::::::::::::::

              const callback = function(mutationsList, observer) {
              var isFirst = true;
    for(let mutation of mutationsList) {
        if (mutation.type === 'childList' && isFirst == true) {
        isFirst = false;
         messageHandler.postMessage("ChatOpen");   
        }
    }
};

// Create an observer instance linked to the callback function
var observer = new MutationObserver(callback);
          
// Options for the observer (which mutations to observe)
const config = { attributes: false, childList: true, subtree: false };
const targetNode = document.getElementsByClassName('_2xAQV')[1];
// Start observing the target node for the configured mutations
observer.observe(targetNode, config);

// ::::::::::::: OBSERVER FOR POPUP BOX ::::::::::::::::

// Select the element to observe
const targetNode2 = document.querySelector("#app > div > span:nth-child(2)");

// Options for the observer (which mutations to observe)
const config2 = {
    childList: true,
};

// Callback function to execute when mutations are observed
var callback2 = function(mutationsList, observer) {
 var isFirst = true;
    for(let mutation of mutationsList) {
            if (mutation.type === 'childList' && isFirst == true) {
        isFirst = false;
        if (targetNode2.children.length > 0) { 
            messageHandler.postMessage("PopUpOpen");   
            }
        }
    }
};

// Create an observer instance linked to the callback function
const observer2 = new MutationObserver(callback2);

// Start observing the target node for the configured mutations
observer2.observe(targetNode2, config2);


// ::::::::::::: OBSERVER FOR RIGHT SIDE CARD ::::::::::::::::

const targetNode3 = document.querySelector("div._2Ts6i._1xFRo > span");

// Options for the observer (which mutations to observe)
const config3 = {
    childList: true,
};

// Callback function to execute when mutations are observed
const callback3 = function(mutationsList, observer) {
    var isFirst = true;
    for(let mutation of mutationsList) {  
        if (mutation.type === 'childList' && isFirst == true) {
            isFirst = false;
                  var profileFromChat = document.querySelector("#app > div > div > div._2Ts6i._1xFRo");
            if (targetNode3.children.length > 0) { // Or just `if (element.children.length)`
// It has at least one element as a child
                console.log('A child node has been added or removed.');
                  profileFromChat.style.width = "100%";
                  profileFromChat.style.maxWidth = "100%";
            }else{
                  profileFromChat.style.width = "0";
                  profileFromChat.style.maxWidth = "0";
                console.log('Close');
            }
        }
    }
};

// Create an observer instance linked to the callback function
var observer3 = new MutationObserver(callback3);

// Start observing the target node for the configured mutations
observer3.observe(targetNode3, config3);

              ''');
            });
            Timer timer = Timer.periodic(const Duration(milliseconds: 300),
                (timer) async {
              try {
                // var isLoaded = await controller.runJavaScriptReturningResult(
                //     "document.getElementsByClassName('ZJWuG')[0].value;");
                // print("Loaded Value ${isLoaded}");
                // if (isLoaded == 100) {
                // print("DONE");
                // Future.delayed(Duration(seconds: 2), () async {
                // Timer.periodic(Duration(milliseconds: 3000),
                //     (timer) async {
//                             controller.runJavaScript(
//                                 '''document.querySelectorAll('div.lhggkp7q.ln8gz9je.rx9719la').forEach(function(params) {
//     params.onclick = function() {
//         // Do something when the element is clicked
//         console.log('Element clicked!');
//         messageHandler.postMessage("ChatOpen");
//     };
// });''');
//                           });

                controller.runJavaScript(
                    '''var statusButton = document.querySelector('div[title="Status"]');
                            statusButton.onclick = function() {
                     messageHandler.postMessage("status");
    };
    ''');
                controller.runJavaScript("var isOnChatListScreen = false;");
                controller.runJavaScript(
                    "document.getElementsByClassName('_2xAQV')[0].style.display = 'none';");
                controller.runJavaScript(
                    "document.getElementsByClassName('_2xAQV')[1].style.display = 'none';");
                controller.runJavaScript(
                    "document.getElementsByClassName('_3RGKj')[0].style.flex = 1;");
                controller.runJavaScript(
                    "document.getElementsByClassName('_3RGKj')[1].style.flex = 1;");
                controller.runJavaScript(
                    "document.getElementsByClassName('_3RGKj')[0].style.maxWidth = 'none';");
                controller.runJavaScript(
                    "document.getElementsByClassName('_3RGKj')[1].style.maxWidth = 'none';");
                controller.runJavaScript(
                    "document.getElementsByClassName('_1jJ70')[0].style.minWidth = 0;");
                // });
                timer.cancel();
                // } else {
                //   print("NOT DONE");
                // }
              } catch (e) {
                print("ERROR $e");
              }
            });
          }
          if (message.message == "LogInFalse") {
            print(":::: log In False ::::");
            controller.runJavaScript(
                "document.getElementById('initial_startup').style.display = 'none';");
            controller.runJavaScript(
                "document.getElementsByClassName('landing-wrapper')[0].style.padding = 0;");
            controller.runJavaScript(
                "document.getElementsByClassName('landing-wrapper')[0].style.minWidth = 0;");
            controller.runJavaScript(
                "document.getElementsByClassName('landing-title')[0].innerHTML = 'WhatsApp on your mobile';");
            controller.runJavaScript(
                "document.getElementsByClassName('web')[0].style.backgroundColor = '#FFFFFF';");

            controller.runJavaScript(
                "document.getElementsByClassName('landing-main')[0].style.height = '100vh';");
            controller.runJavaScript(
                "document.getElementsByClassName('landing-main')[0].style.width = '100wh';");
            controller.runJavaScript(
                "document.getElementsByClassName('landing-header')[0].style.display = 'none';");
            controller.runJavaScript(
                "document.getElementsByClassName('landing-window')[0].style.boxShadow = 'none';");
            controller.runJavaScript(
                "document.getElementsByClassName('landing-window')[0].style.scale = 0.9;");
            controller.runJavaScript(
                "document.getElementsByClassName('landing-wrapper-before')[0].style.display = 'none';");
            controller.runJavaScript(
                "document.getElementsByClassName('_2XHqw')[0].style.display = 'none';");
          }
          if (message.message == "PopUpOpen") {
            print(":::: POP UP OPEN ::::");
            controller.runJavaScript(
                '''document.getElementsByClassName('s4r5ooj2')[0].style.minWidth = 0;
  
                if(!!document.getElementsByClassName('hblzrxh7')[0]){
                document.getElementsByClassName('hblzrxh7')[0].style.width = 'auto';
                document.getElementsByClassName('hblzrxh7')[0].style.margin = '20px';
                }
                
                
                ''');
          }
          if (message.message == "ChatSectionOpen") {
            print(":::: Chat Section Open ::::");
          }
        },
      )
      ..setOnConsoleMessage((message) {
        print("CONSOLE MESSAGE ${message.message}");
      })
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print('PROGRESS ${progress}');
            // Update loading bar.
          },
          onPageStarted: (String url) {
            print('ON PAGE START :: $url');
          },
          onUrlChange: (url) {
            print('ON URL CHANGE :: ${url.url}');
          },
          onPageFinished: (String url) async {
            if (url == "https://web.whatsapp.com/") {
              controller.runJavaScript('''
// ::::::::::::: OBSERVER FOR CHAT SECTION OPEN ::::::::::::::::

// Select the element to observe
const loginTargetNode = document;
// Options for the observer (which mutations to observe)
const loginConfig = {
     attributes: true, 
    childList: true, 
    subtree: true 
};

// Callback function to execute when mutations are observed
var loginCallback = function(mutationsList, observer) {
    var loginSection = !!document.querySelector("#app > div > div.two._1jJ70");
      var scanSection = !!document.querySelector('div.landing-wrapper');
 var isFirst = true;
    for(let mutation of mutationsList) {
            if (mutation.type === 'childList' && isFirst == true) {
        isFirst = false;
        if (loginSection == true) { 
            loginObserver.disconnect();
            messageHandler.postMessage("LogInTrue");  
            console.log("::::: ChatSectionOpen ::::::::::::");
            }
        }
        else if(scanSection == true){
          messageHandler.postMessage("LogInFalse");  
            console.log("::::: SCANNER SCREEN ::::::::::::");
        }
    }
};

// Create an observer instance linked to the callback function
const loginObserver = new MutationObserver(loginCallback);

// Start observing the target node for the configured mutations
loginObserver.observe(loginTargetNode, loginConfig);

 ''');

              controller.runJavaScript(
                  "document.getElementById('app').style.display = 'none';");
              Future.delayed(const Duration(seconds: 2), () async {
                controller.runJavaScript(
                    "document.getElementById('app').style.display = 'block';");
                var isLogin = await controller.runJavaScriptReturningResult(
                    "document.getElementsByClassName('landing-wrapper').length;");
                print('IsLogin ${isLogin}');
                if (isLogin != 0) {
                  // controller.runJavaScript(
                  //     "document.getElementById('initial_startup').style.display = 'none';");
                  // controller.runJavaScript(
                  //     "document.getElementsByClassName('landing-wrapper')[0].style.padding = 0;");
                  // controller.runJavaScript(
                  //     "document.getElementsByClassName('landing-wrapper')[0].style.minWidth = 0;");
                  // controller.runJavaScript(
                  //     "document.getElementsByClassName('landing-title')[0].innerHTML = 'WhatsApp on your mobile';");
                  // controller.runJavaScript(
                  //     "document.getElementsByClassName('web')[0].style.backgroundColor = '#FFFFFF';");
                  //
                  // controller.runJavaScript(
                  //     "document.getElementsByClassName('landing-main')[0].style.height = '100vh';");
                  // controller.runJavaScript(
                  //     "document.getElementsByClassName('landing-main')[0].style.width = '100wh';");
                  // controller.runJavaScript(
                  //     "document.getElementsByClassName('landing-header')[0].style.display = 'none';");
                  // controller.runJavaScript(
                  //     "document.getElementsByClassName('landing-window')[0].style.boxShadow = 'none';");
                  // controller.runJavaScript(
                  //     "document.getElementsByClassName('landing-window')[0].style.scale = 0.9;");
                  // controller.runJavaScript(
                  //     "document.getElementsByClassName('landing-wrapper-before')[0].style.display = 'none';");
                  // controller.runJavaScript(
                  //     "document.getElementsByClassName('_2XHqw')[0].style.display = 'none';");
                } else {
//                   Future.delayed(Duration(seconds: 2), () async {
//                     controller.runJavaScript('''
//
// // ::::::::::::: OBSERVER FOR CHAT OPEN ::::::::::::::::
//
//               const callback = function(mutationsList, observer) {
//               var isFirst = true;
//     for(let mutation of mutationsList) {
//         if (mutation.type === 'childList' && isFirst == true) {
//         isFirst = false;
//          messageHandler.postMessage("ChatOpen");
//         }
//     }
// };
//
// // Create an observer instance linked to the callback function
// var observer = new MutationObserver(callback);
//
// // Options for the observer (which mutations to observe)
// const config = { attributes: false, childList: true, subtree: false };
// const targetNode = document.getElementsByClassName('_2xAQV')[1];
// // Start observing the target node for the configured mutations
// observer.observe(targetNode, config);
//
// // ::::::::::::: OBSERVER FOR POPUP BOX ::::::::::::::::
//
// // Select the element to observe
// const targetNode2 = document.querySelector("#app > div > span:nth-child(2)");
//
// // Options for the observer (which mutations to observe)
// const config2 = {
//     childList: true,
// };
//
// // Callback function to execute when mutations are observed
// var callback2 = function(mutationsList, observer) {
//  var isFirst = true;
//     for(let mutation of mutationsList) {
//             if (mutation.type === 'childList' && isFirst == true) {
//         isFirst = false;
//         if (targetNode2.children.length > 0) {
//             messageHandler.postMessage("PopUpOpen");
//             }
//         }
//     }
// };
//
// // Create an observer instance linked to the callback function
// const observer2 = new MutationObserver(callback2);
//
// // Start observing the target node for the configured mutations
// observer2.observe(targetNode2, config2);
//
//
// // ::::::::::::: OBSERVER FOR RIGHT SIDE CARD ::::::::::::::::
//
// const targetNode3 = document.querySelector("div._2Ts6i._1xFRo > span");
//
// // Options for the observer (which mutations to observe)
// const config3 = {
//     childList: true,
// };
//
// // Callback function to execute when mutations are observed
// const callback3 = function(mutationsList, observer) {
//     var isFirst = true;
//     for(let mutation of mutationsList) {
//         if (mutation.type === 'childList' && isFirst == true) {
//             isFirst = false;
//                   var profileFromChat = document.querySelector("#app > div > div > div._2Ts6i._1xFRo");
//             if (targetNode3.children.length > 0) { // Or just `if (element.children.length)`
// // It has at least one element as a child
//                 console.log('A child node has been added or removed.');
//                   profileFromChat.style.width = "100%";
//                   profileFromChat.style.maxWidth = "100%";
//             }else{
//                   profileFromChat.style.width = "0";
//                   profileFromChat.style.maxWidth = "0";
//                 console.log('Close');
//             }
//         }
//     }
// };
//
// // Create an observer instance linked to the callback function
// var observer3 = new MutationObserver(callback3);
//
// // Start observing the target node for the configured mutations
// observer3.observe(targetNode3, config3);
//
//               ''');
//                   });
//                   Timer timer = Timer.periodic(Duration(milliseconds: 300),
//                       (timer) async {
//                     try {
//                       var isLoaded = await controller.runJavaScriptReturningResult(
//                           "document.getElementsByClassName('ZJWuG')[0].value;");
//                       // print("Loaded Value ${isLoaded}");
//                       if (isLoaded == 100) {
//                         // print("DONE");
//                         Future.delayed(Duration(seconds: 2), () async {
//                           // Timer.periodic(Duration(milliseconds: 3000),
//                           //     (timer) async {
// //                             controller.runJavaScript(
// //                                 '''document.querySelectorAll('div.lhggkp7q.ln8gz9je.rx9719la').forEach(function(params) {
// //     params.onclick = function() {
// //         // Do something when the element is clicked
// //         console.log('Element clicked!');
// //         messageHandler.postMessage("ChatOpen");
// //     };
// // });''');
// //                           });
//
//                           controller.runJavaScript(
//                               '''var statusButton = document.querySelector('div[title="Status"]');
//                             statusButton.onclick = function() {
//                      messageHandler.postMessage("status");
//     };
//     ''');
//                           controller
//                               .runJavaScript("var isOnChatListScreen = false;");
//                           controller.runJavaScript(
//                               "document.getElementsByClassName('_2xAQV')[0].style.display = 'none';");
//                           controller.runJavaScript(
//                               "document.getElementsByClassName('_2xAQV')[1].style.display = 'none';");
//                           controller.runJavaScript(
//                               "document.getElementsByClassName('_3RGKj')[0].style.flex = 1;");
//                           controller.runJavaScript(
//                               "document.getElementsByClassName('_3RGKj')[1].style.flex = 1;");
//                           controller.runJavaScript(
//                               "document.getElementsByClassName('_3RGKj')[0].style.maxWidth = 'none';");
//                           controller.runJavaScript(
//                               "document.getElementsByClassName('_3RGKj')[1].style.maxWidth = 'none';");
//                           controller.runJavaScript(
//                               "document.getElementsByClassName('_1jJ70')[0].style.minWidth = 0;");
//                         });
//                         timer.cancel();
//                       } else {
//                         print("NOT DONE");
//                       }
//                     } catch (e) {
//                       print("ERROR $e");
//                     }
//                   });
                }
              });
            }

            print('URL ${url}');
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://web.whatsapp.com/'));
  }

  final GlobalKey webViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    void _showAlertDialog(BuildContext context) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          content: const Text('Are you sure to go to home?'),
          title: const Text('Alert!'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColor.whiteBgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.whiteColor,
        leading: Padding(
          padding: const EdgeInsets.all(13.0),
          child: InkWell(
            onTap: () {
              _showAlertDialog(context);
            },
            child: const Icon(
              Icons.home_filled,
              color: AppColor.blackColor,
              grade: 1.1,
              size: 25,
            ),
          ),
        ),
        title: TextWidget(
          'Chats',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.reload();
              },
              icon: const Icon(
                Icons.refresh_rounded,
                size: 25,
                color: AppColor.blackColor,
              ))
        ],
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: RefreshIndicator(
            onRefresh: () async {
              controller.reload();
            },
            child: WebViewWidget(controller: controller),
          ),
        ),
      ),
    );
  }
}

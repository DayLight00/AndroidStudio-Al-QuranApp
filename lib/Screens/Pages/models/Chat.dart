import 'package:cached_network_image/cached_network_image.dart';
class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Din 2",
    lastMessage: "Hope you are doing well...",
    image: 'https://scontent.fkul8-1.fna.fbcdn.net/v/t1.6435-9/90204075_1311875075673137_2227768316317925376_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=174925&_nc_ohc=78En2UQGLuIAX9YF4B5&_nc_ht=scontent.fkul8-1.fna&oh=00_AT8O_f2TjNfM3unLUNEYP-5a6ifyy9vMDG_GcuDeLVIxVw&oe=61FB4930',
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Ust Jak",
    lastMessage: "Hello Abdullah! I am...",
    image: 'https://scontent.fkul18-1.fna.fbcdn.net/v/t1.18169-9/15253365_1221858231193249_5720161828918945653_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=9267fe&_nc_ohc=3HC7Ba5eL2wAX-OdmQR&_nc_ht=scontent.fkul18-1.fna&oh=00_AT-n6_t-ZUBfj1lM_tXR6B-6b73tewxueco_E5yh9qoK5A&oe=621FFDC8',
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Hafiq",
    lastMessage: "Do you have update...",
    image: 'https://scontent.fkul18-2.fna.fbcdn.net/v/t1.6435-9/68769009_636751016818820_6460722039819862016_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=730e14&_nc_ohc=mb8dxpTk3mMAX_GbWM8&_nc_ht=scontent.fkul18-2.fna&oh=00_AT_H42CXVuoVXSzqE4qe8Ywx38coNRhiELeYOUlYLMKnfQ&oe=621C9834',
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "Ust Mas",
    lastMessage: "You’re welcome :)",
    image: 'https://scontent.fkul18-1.fna.fbcdn.net/v/t1.18169-9/15253365_1221858231193249_5720161828918945653_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=9267fe&_nc_ohc=3HC7Ba5eL2wAX-OdmQR&_nc_ht=scontent.fkul18-1.fna&oh=00_AT-n6_t-ZUBfj1lM_tXR6B-6b73tewxueco_E5yh9qoK5A&oe=621FFDC8',
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    name: "Ustazah Munirah",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isActive: false,
  ),
  Chat(
    name: "Izzat Aiman",
    lastMessage: "Hope you are doing well...",
    image: 'https://scontent.fkul8-1.fna.fbcdn.net/v/t1.6435-9/90204075_1311875075673137_2227768316317925376_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=174925&_nc_ohc=78En2UQGLuIAX9YF4B5&_nc_ht=scontent.fkul8-1.fna&oh=00_AT8O_f2TjNfM3unLUNEYP-5a6ifyy9vMDG_GcuDeLVIxVw&oe=61FB4930',
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Zul",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: 'https://scontent.fkul18-2.fna.fbcdn.net/v/t1.6435-9/68769009_636751016818820_6460722039819862016_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=730e14&_nc_ohc=mb8dxpTk3mMAX_GbWM8&_nc_ht=scontent.fkul18-2.fna&oh=00_AT_H42CXVuoVXSzqE4qe8Ywx38coNRhiELeYOUlYLMKnfQ&oe=621C9834',
    time: "5d ago",
    isActive: false,
  ),
];

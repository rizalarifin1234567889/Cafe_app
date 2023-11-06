import 'package:flutter/material.dart';
import 'package:caffe_app/core.dart';
import '../controller/mainmenu_controller.dart';

class MainmenuView extends StatefulWidget {
  const MainmenuView({Key? key}) : super(key: key);

  Widget build(context, MainmenuController controller) {
    controller.view = this;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              padding: const EdgeInsets.all(10.0),
              width: 60,
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person_2_outlined,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            // bungkus expanded (AlT+E)
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  width: 100,
                  decoration: const BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black),
                        child: Image.network(
                          // alt+shift+l untuk blocklink
                          "https://cdn-icons-png.flaticon.com/128/590/590836.png",
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        "Selamat Pagi",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        "Muhammad Yusuf",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),

                      // untuk menambahkan fungsi const, tekan (ctrl+shift+alt=1) maka akan ada folder setting.json di vscode

                      // bungkus text dengan scroll view (ALT+SHIFT+J)
                      // agar tidak terputus dipinggir berikan perintah clipnone
                      SingleChildScrollView(
                        clipBehavior: Clip.none,
                        controller: ScrollController(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(controller.kategori.length,
                              (index) {
                            var item = controller.kategori[index];
                            bool klikmenu = controller.pilihkategori == index;

                            // bungkus text dengan container, agar bisa memisah per kata, lalu gunakan perintah mr15
                            //  tekan ctrl+shift+c untuk menuju ke halaman mainmenu_controller
                            return Container(
                              margin: const EdgeInsets.only(
                                right: 15.0,
                              ),
                              child: InkWell(
                                onTap: () => controller.updatekategori(index),
                                child: Text(
                                  "$item", //tekan alt+shift+enter
                                  style: TextStyle(
                                      fontSize: klikmenu ? 16.0 : 14,
                                      fontWeight: klikmenu
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: klikmenu
                                          ? Colors.red
                                          : Colors.grey), //alt shift enter
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      // agar bisa list view tekan Alt+shift+j
                      SingleChildScrollView(
                        controller: ScrollController(),
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        child: Row(
                          children: List.generate(10, (index) {
                            var item = controller.products[index];
                            return Container(
                              // arahkan ke mainmenu_controller ctrl+shift C
                              margin: const EdgeInsets.only(
                                right: 12.0,
                              ),
                              width: 90,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Image.network(
                                      item["photo"],
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    item["product_name"], //alt shift enter
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Rp ${item["price"]}K", //alt shift enter
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.add,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "Nikmati kopi di pagi hari anda",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 160.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://shopee.co.id/inspirasi-shopee/wp-content/uploads/2022/02/cafe-di-bekasi-1280x720.webp",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              8.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.0 / 1.4,
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemCount: controller.products.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var item = controller.products[index];
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          item["photo"],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          6.0,
                                        ),
                                      ),
                                    ),
                                    child: const Stack(
                                      children: [
                                        Positioned(
                                          right: 6.0,
                                          top: 8.0,
                                          child: CircleAvatar(
                                            radius: 14.0,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  item["product_name"],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  item["category"],
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "Rp ${item["price"]}K",
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<MainmenuView> createState() => MainmenuController();
}

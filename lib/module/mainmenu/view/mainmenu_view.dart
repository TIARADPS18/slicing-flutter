import 'package:flutter/material.dart';
import 'package:flutter2/core.dart';
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
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_bag,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_sharp,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.food_bank,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chat,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        //berikan padding 20 (p20)
                        padding: const EdgeInsets.all(20.0),
                        height: 130.0,
                        width: 130.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://o.remove.bg/downloads/f7489a24-eb21-4ce4-83d7-ecec914379d5/coffee-logo-for-cafe-resto-and-product-label-vector-35029143-removebg-preview.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "CAFE PINGGIR SAWAH",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.location_history,
                        size: 24.0,
                      ),
                      const Text(
                        "jl. Pati-Tayu km.22",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SingleChildScrollView(
                        controller: ScrollController(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(controller.kategori.length,
                              (index) {
                            var item = controller.kategori[index];
                            bool gantiwarna =
                                controller.pilihkategoriindex == index;
                            return InkWell(
                              onTap: () =>
                                  controller.updatekategoriindex(index),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  right: 20.0,
                                ),
                                child: Text(
                                  "$item",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: gantiwarna
                                          ? Colors.brown
                                          : Colors.grey),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SingleChildScrollView(
                        controller: ScrollController(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(controller.products.length,
                              (index) {
                            var item = controller.products[index];
                            return SizedBox(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      right: 12.0,
                                    ),
                                    height: 160.0,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          item["photo"],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    item["product_name"],
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Rp${item["price"]}K",
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.shopping_bag,
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
                        "Menikmati kopi di pagi hari",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: 400,
                        height: 160.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "data:image/jpeg;base64,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",
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
                                  "${item["price"]}",
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

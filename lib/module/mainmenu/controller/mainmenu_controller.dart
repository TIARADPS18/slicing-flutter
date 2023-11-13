import 'package:flutter/material.dart';
import 'package:flutter2/core.dart';
import '../view/mainmenu_view.dart';

class MainmenuController extends State<MainmenuView> {
  static late MainmenuController instance;
  late MainmenuView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  List kategori = [
    "Rekomendasi",
    "menu baru",
    "sarapan",
    "kopi",
    "minuman",
    "snack"
  ];
  int pilihkategoriindex = 0;
  //metod
  updatekategoriindex(int newindex) {
    pilihkategoriindex = newindex;
    setState(() {});
  }

  List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "photo":
          "https://eu-central.storage.cloudconvert.com/tasks/adb352ba-9136-4b70-8c58-fddc695783b8/a7e9eaa0-1c22-42b0-a11f-0a5ad1d30126.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=cloudconvert-production%2F20231113%2Ffra%2Fs3%2Faws4_request&X-Amz-Date=20231113T030739Z&X-Amz-Expires=86400&X-Amz-Signature=947e18b856a58f60400ba83484e613e9b6a22fb19b1e2d233a5afd2ca6626cb7&X-Amz-SignedHeaders=host&response-content-disposition=inline%3B%20filename%3D%22a7e9eaa0-1c22-42b0-a11f-0a5ad1d30126.jpg%22&response-content-type=image%2Fjpeg&x-id=GetObject",
      "product_name": "Nasi Goreng Babat",
      "price": 25,
      "category": "Food",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 20,
      "is_favorite": false,
    },
    {
      "id": 2,
      "photo":
          "https://eu-central.storage.cloudconvert.com/tasks/b307d1bc-5640-426d-9d5d-252468f4a50b/resep-soto-ayam-santan-bumbu-kemiri.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=cloudconvert-production%2F20231113%2Ffra%2Fs3%2Faws4_request&X-Amz-Date=20231113T030957Z&X-Amz-Expires=86400&X-Amz-Signature=599caa64c84d432bd7cc2758841ed59c78f84bfdf1f241c5af4abe496f3b04e5&X-Amz-SignedHeaders=host&response-content-disposition=inline%3B%20filename%3D%22resep-soto-ayam-santan-bumbu-kemiri.jpg%22&response-content-type=image%2Fjpeg&x-id=GetObject",
      "product_name": "Soto Kemiri",
      "price": 15,
      "category": "Food",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 18,
      "is_favorite": true,
    },
    {
      "id": 3,
      "photo":
          "data:image/jpeg;base64,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",
      "product_name": "kopi",
      "price": 13,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 28,
      "is_favorite": false,
    },
    {
      "id": 4,
      "photo":
          "https://eu-central.storage.cloudconvert.com/tasks/a30575ae-9c87-4598-9ef2-b68ac1522f98/Resep-Cara-Membuat-Wedang-Coro-Khas-Pati.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=cloudconvert-production%2F20231113%2Ffra%2Fs3%2Faws4_request&X-Amz-Date=20231113T031500Z&X-Amz-Expires=86400&X-Amz-Signature=a94c55bc57c5a96270f9db821b6cc03b56e606dd10b37ba370075480611c57df&X-Amz-SignedHeaders=host&response-content-disposition=inline%3B%20filename%3D%22Resep-Cara-Membuat-Wedang-Coro-Khas-Pati.jpg%22&response-content-type=image%2Fjpeg&x-id=GetObject",
      "product_name": "Wedang Coro ",
      "price": 31,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 25,
      "is_favorite": true,
    },
    {
      "id": 5,
      "photo":
          "https://eu-central.storage.cloudconvert.com/tasks/5635c932-1617-4445-96c2-ad8b0f212af0/Tahu-walik-ayam-378804397.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=cloudconvert-production%2F20231113%2Ffra%2Fs3%2Faws4_request&X-Amz-Date=20231113T032652Z&X-Amz-Expires=86400&X-Amz-Signature=3bdc9053673aa55a27d48126ff66795303286f7d5f1f27f13a5de29b597c2492&X-Amz-SignedHeaders=host&response-content-disposition=inline%3B%20filename%3D%22Tahu-walik-ayam-378804397.jpg%22&response-content-type=image%2Fjpeg&x-id=GetObject",
      "product_name": "Tahu Walik",
      "price": 18,
      "category": "Snack",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 28,
      "is_favorite": true,
    },
    {
      "id": 6,
      "photo":
          "https://eu-central.storage.cloudconvert.com/tasks/a2b3f3d2-a419-4c0b-ac2f-1073bc8c26e9/download.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=cloudconvert-production%2F20231113%2Ffra%2Fs3%2Faws4_request&X-Amz-Date=20231113T032652Z&X-Amz-Expires=86400&X-Amz-Signature=dff7d94a1cdf54f82116fc985b7ba984a91709022f2ae4bf98be5a85f3f83b16&X-Amz-SignedHeaders=host&response-content-disposition=inline%3B%20filename%3D%22download.jpg%22&response-content-type=image%2Fjpeg&x-id=GetObject",
      "product_name": "Cireng",
      "price": 17,
      "category": "Snack",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 45,
      "is_favorite": false,
    },
    {
      "id": 7,
      "photo":
          "https://eu-central.storage.cloudconvert.com/tasks/31a5a1a1-0df2-4afd-93c9-a3af201e4588/download.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=cloudconvert-production%2F20231113%2Ffra%2Fs3%2Faws4_request&X-Amz-Date=20231113T032652Z&X-Amz-Expires=86400&X-Amz-Signature=196200abe96135de222723bfa4c0d47d53325380cdcfe1d21eb4d2f939d6f1c7&X-Amz-SignedHeaders=host&response-content-disposition=inline%3B%20filename%3D%22download.jpg%22&response-content-type=image%2Fjpeg&x-id=GetObject",
      "product_name": "Es Bubur Ketan Hitam",
      "price": 15,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 56,
      "is_favorite": false,
    },
    {
      "id": 8,
      "photo":
          "https://eu-central.storage.cloudconvert.com/tasks/76844494-fd08-4742-be4b-2b1ff32a1c90/download.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=cloudconvert-production%2F20231113%2Ffra%2Fs3%2Faws4_request&X-Amz-Date=20231113T033540Z&X-Amz-Expires=86400&X-Amz-Signature=0a0b41072b3f10bc09082490b4fdb845f314580d9fb6f760d998e7b9be84244d&X-Amz-SignedHeaders=host&response-content-disposition=inline%3B%20filename%3D%22download.jpg%22&response-content-type=image%2Fjpeg&x-id=GetObject",
      "product_name": "Sosis Solo",
      "price": 12,
      "category": "Snack",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 50,
      "is_favorite": true,
    },
    {
      "id": 9,
      "photo":
          "https://eu-central.storage.cloudconvert.com/tasks/fc7c2996-67e6-4b82-a4fe-e9f4a8a6af8f/images.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=cloudconvert-production%2F20231113%2Ffra%2Fs3%2Faws4_request&X-Amz-Date=20231113T033540Z&X-Amz-Expires=86400&X-Amz-Signature=398e88d0c09d752b4b3dace8f0f7a88319e2dfdb3579f2fff5c7c070056ad5b6&X-Amz-SignedHeaders=host&response-content-disposition=inline%3B%20filename%3D%22images.jpg%22&response-content-type=image%2Fjpeg&x-id=GetObject",
      "product_name": "Es Teler",
      "price": 17,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 50,
      "is_favorite": true
    },
    {
      "id": 10,
      "photo":
          "https://eu-central.storage.cloudconvert.com/tasks/8932fcc1-0a5c-4263-b028-00942dec113a/images.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=cloudconvert-production%2F20231113%2Ffra%2Fs3%2Faws4_request&X-Amz-Date=20231113T033540Z&X-Amz-Expires=86400&X-Amz-Signature=dca2d366ec31dfdef7ae745d9f321f67a891b4b68c93453e8f63b73dd6f3eb96&X-Amz-SignedHeaders=host&response-content-disposition=inline%3B%20filename%3D%22images.jpg%22&response-content-type=image%2Fjpeg&x-id=GetObject",
      "product_name": "Es Teh Sereh Lemon",
      "price": 7,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 50,
      "is_favorite": true
    },
  ];
}

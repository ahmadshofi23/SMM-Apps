import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smm_apps/core/utils/Colors.dart';
import 'package:smm_apps/core/widget/default_button.dart';
import 'package:smm_apps/feature/product/domain/entity/product_respons_entity.dart';
import 'package:smm_apps/feature/product/presentation/bloc/product_bloc.dart';

class DetailProductScreen extends StatefulWidget {
  DetailProductScreen({Key? key}) : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  final TextEditingController _jmlhController = TextEditingController();

  late ProductBloc productBloc;
  @override
  void initState() {
    productBloc = BlocProvider.of<ProductBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductsEntity;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state.isLoading == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Loading...'),
              ),
            );
          }
        },
        child: Scaffold(
            backgroundColor: AppColor().kBackgroundColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(CupertinoIcons.arrow_left,
                                size: 24)),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          height: 229,
                          decoration: BoxDecoration(
                            color: AppColor().kFillCardColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/picture1.jpeg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          args.name,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColor().kBlackColor,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Detail produk",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColor().kBlackColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Packing',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor().kFontColorPlaceHolder,
                              ),
                            ),
                            const SizedBox(width: 36),
                            Text(
                              'Strip',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor().kBlackColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Satuan',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor().kFontColorPlaceHolder,
                              ),
                            ),
                            const SizedBox(width: 40),
                            Text(
                              '100 qty per kit',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor().kBlackColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Batch',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor().kFontColorPlaceHolder,
                              ),
                            ),
                            const SizedBox(width: 50),
                            Text(
                              'NUV792542',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor().kBlackColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Exp date',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor().kFontColorPlaceHolder,
                              ),
                            ),
                            const SizedBox(width: 28),
                            Text(
                              '11/02/2024',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor().kBlackColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _jmlhController,
                          decoration: InputDecoration(
                            hintText: 'Jumlah',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: AppColor().kFontColorPlaceHolder,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColor().kFontColorPlaceHolder,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColor().kFontColorPlaceHolder,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppColor().kFontColorPlaceHolder,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        DefaultButton(
                          text: 'Tambah ke Cart',
                          press: () async {
                            print('ID PRODUCT ${args.id}');
                            BlocProvider.of<ProductBloc>(context).add(
                              AddToChart(
                                  productId: args.id,
                                  qty: _jmlhController.text),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

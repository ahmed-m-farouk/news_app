import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view.dart';

class ArticalItem extends StatelessWidget {
  const ArticalItem({
    super.key,
    required this.artical,
  });

  final artical;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen('${artical['url']}'));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: "${artical['urlToImage']}",
              imageBuilder: (context, imageProvider) => Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const SizedBox(
                width: 120,
                height: 120,
                child: Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),

            // Container(
            //   height: 120,
            //   width: 120,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(25),
            //   ),
            //   child: Image(
            //     height: 120,
            //     width: 120,
            //     image: NetworkImage(' ${artical['urlToImage']}'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        ' ${artical['title']}',
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 3,
                      ),
                    ),
                    Text(
                      '${artical['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

Widget defaoultTextFromFiled({
  Function(dynamic)? onchange,
  Function()? ontap,
  Function(dynamic)? onflidsubmitted,
  required FormFieldValidator<String> valitator,
  required IconData? prefixicon,
  IconData? suffix,
  Function()? suffixpresss,
  required TextEditingController control,
  required TextInputType type,
  required String lable,
  bool ispassword = false,
}) =>
    TextFormField(
      controller: control,
      keyboardType: type, // تغيير نوع لوحة المفاتيح بناءً على type المدخل
      obscureText: ispassword,
      onChanged: onchange,
      onTap: ontap,
      onFieldSubmitted: onflidsubmitted,
      validator: valitator,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixicon),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixpresss, icon: Icon(suffix))
            : null,
        border: const OutlineInputBorder(),
        labelText: lable,
      ),
    );

Widget articalBuliderList(List, {isSearch = false}) => ConditionalBuilder(
      condition: List.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) {
          return ArticalItem(artical: List[index]);
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20,
          ),
          child: Container(
            height: 1,
            color: Colors.grey[400],
          ),
        ),
        itemCount: List.length,
      ),
      fallback: (context) => isSearch
          ? Container()
          : const Center(child: CircularProgressIndicator()),
    );

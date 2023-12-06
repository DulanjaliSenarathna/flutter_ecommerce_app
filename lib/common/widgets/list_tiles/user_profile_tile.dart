import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
     leading: const CircularImage(image: TImages.user, 
     width: 50,
     height: 50,
     padding: 0,
     isNetworkImage: false,
     ),
     title: Text('Dulanjali Senarathna', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
     subtitle: Text('dulanjalisen93@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
     trailing: IconButton(onPressed: (){}, icon: const Icon(Iconsax.edit, color: TColors.white,)),
                  );
  }
}
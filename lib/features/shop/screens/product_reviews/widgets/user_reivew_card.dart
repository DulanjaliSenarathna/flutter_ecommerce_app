import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1),),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        //Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('01 Nov 2023', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const ReadMoreText(
          'I could not be happier with my results. I have gotten both my lips and done at Pura Vida and this is the best they’ve looked in the 10+ years of me getting filler. I’ve had a great experience with Pura Vida and have gotten honest answers to all my questions.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: TColors.primary)
          ),
          const SizedBox(height: TSizes.spaceBtwItems,),

          //Company Review
          RoundedContainer(
            backgroundColor: darkMode? TColors.darkerGrey: TColors.grey,
            child: Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('E Store', style: Theme.of(context).textTheme.titleMedium,),
                      Text('02 Nov 2023', style: Theme.of(context).textTheme.bodyMedium,),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  
                  const ReadMoreText(
                    'I could not be happier with my results. I have gotten both my lips and done at Pura Vida and this is the best they’ve looked in the 10+ years of me getting filler. I’ve had a great experience with Pura Vida and have gotten honest answers to all my questions.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'show less',
                    trimCollapsedText: 'show more',
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: TColors.primary),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: TColors.primary)
                    ),
                  
                          ],
              ),
              ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems,)
        
      ],
    );
  }
}
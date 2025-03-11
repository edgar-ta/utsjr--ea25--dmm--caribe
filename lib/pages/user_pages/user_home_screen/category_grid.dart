import 'package:caribe/model/category_class.dart';
import 'package:caribe/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryGrid extends StatelessWidget {
  CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    int categoriesPerColumn = 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: List.generate(
          (CategoryClass.categories.length / categoriesPerColumn).toInt() * 2 -
              1,
          (superIndex) {
            if (superIndex % 2 == 1) {
              return SizedBox(width: 8);
            }
            return Expanded(
              child: Column(
                children: List.generate(
                  categoriesPerColumn * 2 - 1,
                  (subIndex) {
                    if (subIndex % 2 == 1) {
                      return SizedBox(height: 8);
                    }
                    int index = (superIndex / 2).toInt() * categoriesPerColumn +
                        (subIndex / 2).toInt();
                    return Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: CategoryCard(
                          category: CategoryClass.categories[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final CategoryClass category;

  CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      label: Text(
        category.label,
        style: TextStyle(
          color: AppColors.arenaCalida,
        ),
      ),
      icon: Icon(category.icon, color: AppColors.arenaCalida),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(category.color),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

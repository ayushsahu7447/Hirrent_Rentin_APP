// import 'package:flutter/material.dart';
//
// class ShoppingCategoryPage extends StatefulWidget {
//   const ShoppingCategoryPage({Key? key}) : super(key: key);
//
//   @override
//   _ShoppingCategoryPageState createState() => _ShoppingCategoryPageState();
// }
//
// class _ShoppingCategoryPageState extends State<ShoppingCategoryPage> {
//   String _selectedCategory = 'Men'; // default selected category
//
//   List<Category> _categories = [    Category(      name: 'Men',      image: 'assets/images/men.jpg',      subcategories: [        Subcategory(          name: 'Clothing',          image: 'assets/images/men-clothing.jpg',          subsubcategories: ['Shirts', 'T-Shirts', 'Jeans', 'Shorts'],
//   ),
//     Subcategory(
//       name: 'Footwear',
//       image: 'assets/images/men-footwear.jpg',
//       subsubcategories: ['Casual Shoes', 'Sports Shoes', 'Formal Shoes'],
//     ),
//   ],
//   ),
//     Category(
//       name: 'Women',
//       image: 'assets/images/women.jpg',
//       subcategories: [
//         Subcategory(
//           name: 'Clothing',
//           image: 'assets/images/women-clothing.jpg',
//           subsubcategories: ['Dresses', 'Tops', 'Jeans', 'Shorts'],
//         ),
//         Subcategory(
//           name: 'Footwear',
//           image: 'assets/images/women-footwear.jpg',
//           subsubcategories: ['Heels', 'Flats', 'Sports Shoes'],
//         ),
//       ],
//     ),
//     Category(
//       name: 'Kids',
//       image: 'assets/images/kids.jpg',
//       subcategories: [
//         Subcategory(
//           name: 'Boys',
//           image: 'assets/images/kids-boys.jpg',
//           subsubcategories: ['Tops', 'Bottoms', 'Jackets', 'Shoes'],
//         ),
//         Subcategory(
//           name: 'Girls',
//           image: 'assets/images/kids-girls.jpg',
//           subsubcategories: ['Dresses', 'Tops', 'Bottoms', 'Shoes'],
//         ),
//       ],
//     ),
//   ]; // list of categories with subcategories and subsubcategories
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Shopping Categories'),
//         ),
//         body: Padding(
//         padding: const EdgeInsets.all(16.0),
//     child: ListView(
//     children: [
//     DropdownButton<String>(
//     value: _selectedCategory,
//     onChanged: (String? category) {
//     setState(() {
//     _selectedCategory = category!;
//     });
//     },
//     items: _categories.map((Category category) {
//     return DropdownMenuItem<String>(
//     value: category.name,
//     child: Text(category.name),
//     );
//     }).toList(),
//     ),
//     SizedBox(height: 16),
//     Text(
//     'Subcategories for $_selectedCategory:',
//     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//     ),
//     SizedBox(height: 8),
//     ListView.builder(
//     shrinkWrap: true,
//     physics: ClampingScrollPhysics(),
//     itemCount: _categories
//         .firstWhere((category) =>
//     category.name == _selectedCategory)
//         .subcategories
//         .length,
//     itemBuilder: (BuildContext context, int index) {
//     return ExpansionTile(
//     leading: Image.asset(
//     _categories
//     .firstWhere((category) => category.name == _selectedCategory)
//         .subcategories[index]
//         .image,
//       width: 50,
//       height: 50,
//       fit: BoxFit.cover,
//     ),
//       title: Text(
//         _categories
//             .firstWhere((category) =>
//         category.name == _selectedCategory)
//             .subcategories[index]
//             .name,
//       ),
//       children: [
//         GridView.builder(
//           shrinkWrap: true,
//           physics: ClampingScrollPhysics(),
//           itemCount: _categories
//               .firstWhere((category) =>
//           category.name == _selectedCategory)
//               .subcategories[index]
//               .subsubcategories
//               .length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 1.0,
//           ),
//           itemBuilder: (BuildContext context, int subIndex) {
//             return InkWell(
//               onTap: () {
// // Navigate to the corresponding page
//               },
//               child: Card(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/images/${_categories.firstWhere((category) => category.name == _selectedCategory).subcategories[index].subsubcategories[subIndex].toLowerCase()}.jpg',
//                       width: 50,
//                       height: 50,
//                       fit: BoxFit.cover,
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       _categories
//                           .firstWhere((category) =>
//                       category.name == _selectedCategory)
//                           .subcategories[index]
//                           .subsubcategories[subIndex],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//     },
//     ),
//     ],
//     ),
//         ),
//     );
//   }
// }
//
// class Category {
//   String name;
//   String image;
//   List<Subcategory> subcategories;
//
//   Category({
//     required this.name,
//     required this.image,
//     required this.subcategories,
//   });
// }
//
// class Subcategory {
//   String name;
//   String image;
//   List<String> subsubcategories;
//
//   Subcategory({
//     required this.name,
//     required this.image,
//     required this.subsubcategories,
//   });
// }










// import 'package:flutter/material.dart';
//
// class Category {
//   final String name;
//   final String image;
//   final List<Category> subcategories;
//
//   Category({
//     required this.name,
//     required this.image,
//     this.subcategories = const [],
//   });
//
//   @override
//   String toString() => name;
// }
//
// class CategoryPage extends StatefulWidget {
//   @override
//   _CategoryPageState createState() => _CategoryPageState();
// }
//
// class _CategoryPageState extends State<CategoryPage> {
//   final List<Category> categories = [
//     Category(
//       name: 'Electronics',
//       image: 'https://picsum.photos/id/1000/300/150',
//       subcategories: [
//         Category(
//           name: 'Mobile Phones',
//           image: 'https://picsum.photos/id/1001/300/150',
//           subcategories: [
//             Category(
//               name: 'Android',
//               image: 'https://picsum.photos/id/1002/300/150',
//             ),
//             Category(
//               name: 'iOS',
//               image: 'https://picsum.photos/id/1003/300/150',
//             ),
//           ],
//         ),
//         Category(
//           name: 'Laptops',
//           image: 'https://picsum.photos/id/1004/300/150',
//           subcategories: [
//             Category(
//               name: 'Windows',
//               image: 'https://picsum.photos/id/1005/300/150',
//             ),
//             Category(
//               name: 'Mac',
//               image: 'https://picsum.photos/id/1006/300/150',
//             ),
//           ],
//         ),
//       ],
//     ),
//     Category(
//       name: 'Fashion',
//       image: 'https://picsum.photos/id/1007/300/150',
//       subcategories: [
//         Category(
//           name: 'Men',
//           image: 'https://picsum.photos/id/1008/300/150',
//           subcategories: [
//             Category(
//               name: 'Clothing',
//               image: 'https://picsum.photos/id/1009/300/150',
//             ),
//             Category(
//               name: 'Shoes',
//               image: 'https://picsum.photos/id/1010/300/150',
//             ),
//           ],
//         ),
//         Category(
//           name: 'Women',
//           image: 'https://picsum.photos/id/1011/300/150',
//           subcategories: [
//             Category(
//               name: 'Clothing',
//               image: 'https://picsum.photos/id/1012/300/150',
//             ),
//             Category(
//               name: 'Shoes',
//               image: 'https://picsum.photos/id/1013/300/150',
//             ),
//           ],
//         ),
//       ],
//     ),
//   ];
//
//   Category? _selectedCategory;
//   Category? _selectedSubcategory;
//   Category? _selectedSubsubcategory;
//
//   void _selectCategory(Category category) {
//     setState(() {
//       _selectedCategory = category;
//       _selectedSubcategory = null;
//       _selectedSubsubcategory = null;
//     });
//   }
//
//   void _selectSubcategory(Category subcategory) {
//     setState(() {
//       _selectedSubcategory = subcategory;
//       _selectedSubsubcategory = null;
//     });
//   }
//
//   void _selectSubsubcategory(Category subsubcategory) {
//     setState(() {
//       _selectedSubsubcategory = subsubcategory;
//     });
//   }
//
//   Widget _buildCategoryTile(Category category) {
//     final isSelected = _selectedCategory == category;
//     return InkWell(
//         onTap: () => _selectCategory(category),
//         child: Container(
//         margin: EdgeInsets.all(16),
//     decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(10      ),
//       color: isSelected ? Colors.grey[300] : Colors.white,
//     ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.vertical(
//                     top: Radius.circular(10),
//                   ),
//                   child: Image.network(
//                     category.image,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   category.name,
//                   style: TextStyle(
//                     fontWeight: isSelected ? FontWeight.bold : null,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//     );
//   }
//
//   Widget _buildSubcategoryDropdown(Category category) {
//     final subcategories = category.subcategories;
//     if (subcategories.isEmpty) {
//       return SizedBox.shrink();
//     }
//     final items = subcategories
//         .map((subcategory) => DropdownMenuItem(
//       value: subcategory,
//       child: Row(
//         children: [
//           SizedBox(
//             width: 16,
//           ),
//           Image.network(
//             subcategory.image,
//             width: 30,
//             height: 30,
//             fit: BoxFit.cover,
//           ),
//           SizedBox(
//             width: 16,
//           ),
//           Expanded(
//             child: Text(
//               subcategory.name,
//             ),
//           ),
//         ],
//       ),
//     ))
//         .toList();
//     final selectedItem = _selectedSubcategory ??
//         (items.isNotEmpty ? items.first.value as Category : null);
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: DropdownButton(
//         isExpanded: true,
//         value: selectedItem,
//         items: items,
//         onChanged: (value) => _selectSubcategory(value as Category),
//       ),
//     );
//   }
//
//   Widget _buildSubsubcategoryDropdown(Category category) {
//     final subcategories = category.subcategories;
//     if (subcategories.isEmpty) {
//       return SizedBox.shrink();
//     }
//     final items = subcategories
//         .map((subcategory) => DropdownMenuItem(
//       value: subcategory,
//       child: Row(
//         children: [
//           SizedBox(
//             width: 16,
//           ),
//           Image.network(
//             subcategory.image,
//             width: 30,
//             height: 30,
//             fit: BoxFit.cover,
//           ),
//           SizedBox(
//             width: 16,
//           ),
//           Expanded(
//             child: Text(
//               subcategory.name,
//             ),
//           ),
//         ],
//       ),
//     ))
//         .toList();final selectedItem = _selectedSubsubcategory ??
//         (items.isNotEmpty ? items.first.value as Category : null);
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: DropdownButton(
//         isExpanded: true,
//         value: selectedItem,
//         items: items,
//         onChanged: (value) => _selectSubsubcategory(value as Category),
//       ),
//     );
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Categories'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: categories
//                     .map((category) => _buildCategoryTile(category))
//                     .toList(),
//               ),
//             ),
//           ),
//           _buildSubcategoryDropdown(_selectedCategory ?? categories.first),
//           _buildSubsubcategoryDropdown(_selectedSubcategory ??
//               (_selectedCategory?.subcategories?.first ?? categories.first)),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 2,child: _TopPortion()),
          Expanded(flex: 3,
          child: Column(
            children: [
              Text('Ozan',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,),),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: (){}, 
                      heroTag: 'Follow',
                      elevation: 0,
                    label: const Text('Follow'),
                    icon: const Icon(Icons.person_add_alt_1),
                    ),
                    const SizedBox(width: 16,),
                    FloatingActionButton.extended(
                      onPressed: (){}, 
                      heroTag: 'Message',
                      elevation: 0,
                    label: const Text('Message'),
                    icon: const Icon(Icons.message_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                const _ProfileInfoRow(),
            ],
          )),
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({super.key});

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem(title: 'Posts', value: 100),
    ProfileInfoItem(title: 'Followers', value: 200),
    ProfileInfoItem(title: 'Following', value: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
        .map((item) => Expanded(
          child: Row(
            children: [
              if (_items.indexOf(item) != 0) const VerticalDivider(),
              Expanded(child: _singleItem(context, item))
            ],
          ),
        ))
        .toList(),
      ),
    );
  }
}

Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
  mainAxisAlignment: MainAxisAlignment.center,
 children: [
  Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Text(
      item.value.toString(),
      style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  ),
       Text(item.title, style: Theme.of(context).textTheme.bodySmall),
 ],
);
class ProfileInfoItem {
  final String title;
  final int value;

  const ProfileInfoItem({required this.title, required this.value});
}
class _TopPortion extends StatelessWidget {
  const _TopPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff0043ba), Color(0xff006df1)],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        Align(alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: 150,
          height: 150,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://images.unsplash.com/photo-1544005313-94ddf0286df2',
                    ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 0, 255, 106),
                    ),
                  ),
                ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
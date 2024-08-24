import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeShopSettingsPage1 extends StatelessWidget {
  const CoffeeShopSettingsPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: const Color(0xffC67C4E),
       
      ),
      backgroundColor: const Color(0xfff6f6f6),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              const _SingleSection(
                title: "Shop Preferences",
                children: [
                  _CustomListTile(
                      title: "Opening Hours",
                      icon: Icons.access_time_outlined),
                  _CustomListTile(
                      title: "Shop Location",
                      icon: Icons.location_on_outlined),
                  _CustomListTile(
                      title: "Payment Methods",
                      icon: Icons.payment_outlined),
                ],
              ),
              _SingleSection(
                title: "User Settings",
                children: [
                  const _CustomListTile(
                      title: "Profile",
                      icon: Icons.person_outline),
                  _CustomListTile(
                      title: "Notifications",
                      icon: Icons.notifications_outlined,
                      trailing:
                          CupertinoSwitch(value: true, onChanged: (value) {})),
                  const _CustomListTile(
                      title: "Language",
                      icon: Icons.language_outlined),
                ],
              ),
              const _SingleSection(
                title: "Support",
                children: [
                  _CustomListTile(
                      title: "Help & Feedback",
                      icon: Icons.help_outline),
                  _CustomListTile(
                      title: "About Us",
                      icon: Icons.info_outline),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  const _CustomListTile(
      {Key? key, required this.title, required this.icon, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing ?? const Icon(CupertinoIcons.forward, size: 18),
      onTap: () {},
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title.toUpperCase(),
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}

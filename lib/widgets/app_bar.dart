import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onNavItemTap;
  final int selectedIndex;
  static const List<String> _navItems = ['Home', 'Projects', 'About', 'Contact'];

  const CustomAppBar({
    super.key,
    required this.onNavItemTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return AppBar(
      elevation: 2,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Text(
              'Y',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Portfolio',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      actions: [
        if (!isMobile)
          ...List.generate(_navItems.length, (index) {
            return _buildNavItem(index);
          }),
        if (isMobile)
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _showMobileMenu(context);
            },
          ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildNavItem(int index) {
    final isSelected = index == selectedIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () => onNavItemTap(index),
        style: TextButton.styleFrom(
          foregroundColor: isSelected ? Colors.blue : Colors.grey[600],
          backgroundColor:
          isSelected ? Colors.blue.withValues(alpha: 0.1) : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          _navItems[index],
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Menu',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              ...List.generate(_navItems.length, (index) {
                return ListTile(
                  leading: Icon(
                    _getIcon(index),
                    color: index == selectedIndex ? Colors.blue : null,
                  ),
                  title: Text(
                    _navItems[index],
                    style: TextStyle(
                      color: index == selectedIndex ? Colors.blue : null,
                      fontWeight:
                      index == selectedIndex ? FontWeight.bold : null,
                    ),
                  ),
                  trailing: index == selectedIndex
                      ? const Icon(Icons.check, color: Colors.blue)
                      : null,
                  onTap: () {
                    Navigator.pop(context);
                    onNavItemTap(index);
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }

  IconData _getIcon(int index) {
    const icons = [
      Icons.home,
      Icons.code,
      Icons.person,
      Icons.email,
    ];
    return icons[index];
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BonimodeProfilePage(),
    );
  }
}

class BonimodeProfilePage extends StatelessWidget {
  const BonimodeProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Header with gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF4ADE80), Color(0xFF22C55E)],
                ),
              ),
              child: Stack(
                children: [
                  // Background circles
                  ...List.generate(5, (i) {
                    return Positioned(
                      left: MediaQuery.of(context).size.width / 2 - (150 + i * 50),
                      top: -50,
                      child: Container(
                        width: (150 + i * 50).toDouble() * 2,
                        height: (150 + i * 50).toDouble() * 2,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white.withOpacity(0.1), width: 2),
                        ),
                      ),
                    );
                  }),
                  // Logo
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow, color: Colors.white, size: 40),
                          SizedBox(width: 8),
                          Text(
                            'Bonimode',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Main content
            Expanded(
              child: SingleChildScrollView(
                child: Transform.translate(
                  offset: Offset(0, -30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        // Welcome card
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Container(
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 20,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'هم‌اکنون به جمع بانی‌مدی‌ها بپیوندید',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[800],
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'و از تخفیف‌ها زودتر از سایرین با خبر شوید.',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        // Login button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Container(
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF16A34A), Color(0xFF22C55E)],
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF22C55E).withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    'ورود / ثبت نام',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        // Menu items
                        _buildMenuItem(context, 'پیام ها', hasNotification: true),
                        _buildMenuItem(context, 'راهنمای خرید'),
                        _buildMenuItem(context, 'شرایط بازگشت کالا'),
                        _buildMenuItem(context, 'پرسش های متداول'),
                        _buildMenuItem(context, 'قوانین و مقررات'),
                        _buildMenuItem(context, 'درباره بانی‌مد'),
                        _buildMenuItem(context, 'تماس با ما'),
                        SizedBox(height: 32),
                        // Social icons
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildSocialIcon(Icons.album, Colors.grey[800]!),
                              _buildSocialIcon(Icons.play_arrow, Colors.grey[800]!),
                              _buildSocialIcon(Icons.send, Colors.grey[800]!),
                              _buildSocialIcon(Icons.camera_alt, Colors.grey[800]!),
                            ],
                          ),
                        ),
                        SizedBox(height: 32),
                        // Version
                        Text(
                          'v3.09.00 (205290310rm)',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFF22C55E),
            unselectedItemColor: Colors.grey[400],
            selectedFontSize: 12,
            unselectedFontSize: 12,
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'پروفایل',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'سبد خرید',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_outlined),
                label: 'دسته‌بندی‌ها',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'خانه',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, {bool hasNotification = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[100]!, width: 1),
            ),
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              if (hasNotification)
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Icon(Icons.notifications_outlined, color: Color(0xFF22C55E), size: 22),
                ),
              Expanded(
                child: Text(
                  title,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Icon(Icons.chevron_left, color: Colors.grey[400], size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[50],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () {},
          child: Icon(icon, color: color, size: 24),
        ),
      ),
    );
  }
}
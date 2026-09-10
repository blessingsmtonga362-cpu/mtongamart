import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [

          // =========================
          // PROFILE HEADER
          // =========================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              children: [

                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage(
                        "assets/images/iphone.jpg",
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          // Change profile picture
                        },
                        child: Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                const Text(
                  "Blessings Mtonga",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "blessingsmtonga362@gmail.com",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // =========================
          // PERSONAL INFORMATION CARD
          // =========================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.grey.shade200,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // =========================
                // CARD HEADER
                // =========================
                Row(
                  children: [

                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.blue.shade700,
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personal Information",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 3),

                          Text(
                            "Manage your personal details",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Icon(
                      Icons.edit_outlined,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // =========================
                // FULL NAME
                // =========================
                _profileField(
                  label: "Full Name",
                  value: "Blessings Mtonga",
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 18),

                // =========================
                // PHONE
                // =========================
                _profileField(
                  label: "Phone Number",
                  value: "+265 992 708 855",
                  icon: Icons.phone_outlined,
                ),

                const SizedBox(height: 18),

                // =========================
                // EMAIL
                // =========================
                _profileField(
                  label: "Email Address",
                  value: "blessingsmtonga362@gmail.com",
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 18),

                // =========================
                // DELIVERY ADDRESS
                // =========================
                _profileField(
                  label: "Delivery Address",
                  value: "Limbe, Pacific Tower, Floor 18",
                  icon: Icons.location_on_outlined,
                ),

                const SizedBox(height: 25),

                // =========================
                // SAVE BUTTON
                // =========================
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Save profile information
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Save Changes",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // =========================
          // ACCOUNT OPTIONS
          // =========================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.grey.shade200,
              ),
            ),
            child: Column(
              children: [

                _accountOption(
                  icon: Icons.lock_outline,
                  title: "Change Password",
                  subtitle: "Update your account password",
                  onTap: () {},
                ),

                Divider(
                  height: 1,
                  color: Colors.grey.shade200,
                ),

                _accountOption(
                  icon: Icons.notifications_none,
                  title: "Notifications",
                  subtitle: "Manage your notifications",
                  onTap: () {},
                ),

                Divider(
                  height: 1,
                  color: Colors.grey.shade200,
                ),

                _accountOption(
                  icon: Icons.logout,
                  title: "Logout",
                  subtitle: "Sign out of your account",
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // =====================================================
  // PROFILE FIELD
  // =====================================================

  static Widget _profileField({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),

        const SizedBox(height: 7),

        TextField(
          controller: TextEditingController(
            text: value,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              size: 20,
              color: Colors.grey.shade600,
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // =====================================================
  // ACCOUNT OPTION
  // =====================================================

  static Widget _accountOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: Colors.grey.shade700,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
    );
  }
}
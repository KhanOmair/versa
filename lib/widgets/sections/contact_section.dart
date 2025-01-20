import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:versa_web/config/app_config.dart';
import 'package:versa_web/utils/app_theme.dart';
import 'dart:convert';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _companyController = TextEditingController();
  final _messageController = TextEditingController();
  String? _selectedCountry;
  String? _selectedCompanySize;
  bool _isLoading = false;

  final List<String> _companySizes = [
    '1-10 employees',
    '11-50 employees',
    '51-200 employees',
    '201-500 employees',
    '500+ employees'
  ];

  final List<String> _countries = [
    'United States',
    'Canada',
    'United Kingdom',
    // Add more countries as needed
  ];

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() && !_isLoading) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Prepare the template parameters
        final templateParams = {
          'from_name':
              '${_firstNameController.text} ${_lastNameController.text}',
          'from_email': _emailController.text,
          'phone': _phoneController.text,
          'company_size': _selectedCompanySize,
          'country': _selectedCountry,
          'message': _messageController.text,
        };

        final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
        final body = {
          'service_id': AppConfig.serviceId,
          'template_id': AppConfig.templateId,
          'user_id': AppConfig.publicKey,
          'template_params': templateParams,
        };

        final headers = {
          'Content-Type': 'application/json',
        };

        final response =
            await http.post(url, headers: headers, body: json.encode(body));
        // return response.statusCode == 200; // Return true if email was sent successfully

        print(response.body);

        // Show success message
        if (mounted || response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Thank you for your message. We\'ll be in touch soon!'),
              backgroundColor: Colors.green,
            ),
          );
        }

        // Clear form
        _formKey.currentState?.reset();
        _firstNameController.clear();
        _lastNameController.clear();
        _emailController.clear();
        _phoneController.clear();
        _messageController.clear();
        setState(() {
          _selectedCountry = null;
          _selectedCompanySize = null;
        });
      } catch (e) {
        print('Error sending email: $e'); // For debugging
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'There was an error sending your message. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _companyController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile(context) ? 16.0 : 24.0),
      color: AppTheme.primaryDark,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side - Text content
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Talk with our sales\nteam',
                    style: TextStyle(
                      fontSize: isMobile(context) ? 28 : 40,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                      color: AppTheme.primaryLight,
                    ),
                  ),
                  SizedBox(height: isMobile(context) ? 12 : 16),
                  Text(
                    'Fill out your information and a Versa\nrepresentative will reach out to you.',
                    style: TextStyle(
                      fontSize: isMobile(context) ? 12 : 16,
                      color: AppTheme.primaryLight.withOpacity(0.8),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: isMobile(context) ? 16 : 24),
                  // Bullet points with adjusted spacing
                  _buildBulletPoint(
                    'Custom Software Development',
                    'Tailored solutions for your unique business needs',
                    isMobile(context),
                  ),
                  SizedBox(height: isMobile(context) ? 12 : 16),
                  _buildBulletPoint(
                    'Cloud Infrastructure',
                    'Scalable and secure cloud solutions',
                    isMobile(context),
                  ),
                  SizedBox(height: isMobile(context) ? 12 : 16),
                  _buildBulletPoint(
                    'Digital Transformation',
                    'Modernize your business processes',
                    isMobile(context),
                  ),
                  SizedBox(height: isMobile(context) ? 12 : 16),
                  _buildBulletPoint(
                    'Technical Consultation',
                    'Expert guidance for your tech decisions',
                    isMobile(context),
                  ),
                  SizedBox(height: isMobile(context) ? 12 : 16),
                  _buildBulletPoint(
                    'Enterprise Solutions',
                    'Comprehensive solutions for large organizations',
                    isMobile(context),
                  ),
                  SizedBox(height: isMobile(context) ? 12 : 16),
                  _buildBulletPoint(
                    '24/7 Support',
                    'Round-the-clock technical assistance',
                    isMobile(context),
                  ),
                  SizedBox(height: isMobile(context) ? 24 : 30),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'You can also reach us at sales@versahq.online or\ngive us a call at +1 (602) 838-0848',
                      style: TextStyle(
                        fontSize: isMobile(context) ? 14 : 18,
                        color: AppTheme.primaryLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: isMobile(context) ? 20 : 40),
            // Right side - Form
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(isMobile(context) ? 16 : 24),
                decoration: BoxDecoration(
                  color: AppTheme.primaryLight,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              'First Name',
                              _firstNameController,
                              isMobile(context),
                            ),
                          ),
                          SizedBox(width: isMobile(context) ? 12 : 16),
                          Expanded(
                            child: _buildTextField(
                              'Last Name',
                              _lastNameController,
                              isMobile(context),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: isMobile(context) ? 12 : 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              'Company Email',
                              _emailController,
                              isMobile(context),
                            ),
                          ),
                          SizedBox(width: isMobile(context) ? 12 : 16),
                          Expanded(
                            child: _buildTextField(
                              'Phone Number',
                              _phoneController,
                              isMobile(context),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: isMobile(context) ? 12 : 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildDropdown(
                              'Company Size',
                              _selectedCompanySize,
                              _companySizes,
                              isMobile(context),
                              (String? value) {
                                setState(() {
                                  _selectedCompanySize = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: isMobile(context) ? 12 : 16),
                          Expanded(
                            child: _buildDropdown(
                              'Country',
                              _selectedCountry,
                              _countries,
                              isMobile(context),
                              (String? value) {
                                setState(() {
                                  _selectedCountry = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: isMobile(context) ? 12 : 16),
                      _buildTextField(
                        'What would you like to discuss?',
                        _messageController,
                        isMobile(context),
                        maxLines: 3,
                      ),
                      SizedBox(height: isMobile(context) ? 16 : 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.accent,
                            foregroundColor: AppTheme.primaryLight,
                            padding: EdgeInsets.symmetric(
                              vertical: isMobile(context) ? 16 : 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: AppTheme.primaryLight)
                              : Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize: isMobile(context) ? 14 : 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String title, String description, bool isMobile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle,
          color: AppTheme.accent,
          size: isMobile ? 20 : 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.primaryLight,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: AppTheme.primaryLight.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    bool isMobile, {
    bool required = true,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.textDark,
                ),
              ),
              if (required)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          style: TextStyle(fontSize: isMobile ? 13 : 15),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppTheme.primaryLight,
            contentPadding: EdgeInsets.symmetric(
              horizontal: isMobile ? 10 : 12,
              vertical: isMobile ? 8 : 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppTheme.textDark.withOpacity(0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppTheme.textDark.withOpacity(0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppTheme.accent),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(
    String label,
    String? value,
    List<String> items,
    bool isMobile,
    void Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.textDark,
                ),
              ),
              const TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.textDark.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            hint: Text('Select...',
                style: TextStyle(color: AppTheme.textDark.withOpacity(0.4))),
            isExpanded: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
            ),
            items: items.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an option';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DonationFormPage extends StatefulWidget {
  const DonationFormPage({super.key});

  @override
  State<DonationFormPage> createState() => _DonationFormPageState();
}

class _DonationFormPageState extends State<DonationFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Form field controllers
  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();
  final TextEditingController _donorNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  String? bookCondition;
  String? numBooks;
  String? donationMode;
  String? recipientCategory;

  File? _pickedImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDB4437),
        leading: const BackButton(color: Colors.white),
        title: const Text('Bodhi', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings, color: Colors.white)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("📖 Book Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              // Book Name
              const Text("Name Of the Book"),
              TextFormField(
                controller: _bookNameController,
                decoration: inputDecoration(),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter book name' : null,
              ),

              const SizedBox(height: 12),

              // Author
              const Text("Author"),
              TextFormField(
                controller: _authorController,
                decoration: inputDecoration(),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter author name' : null,
              ),

              const SizedBox(height: 12),

              // Genre
              const Text("Genre / Category"),
              TextFormField(
                controller: _genreController,
                decoration: inputDecoration(),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter genre/category' : null,
              ),

              const SizedBox(height: 12),

              // Language
              const Text("Language"),
              TextFormField(
                controller: _languageController,
                decoration: inputDecoration(),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter language' : null,
              ),

              const SizedBox(height: 12),

              // Condition
              const Text("Condition"),
              DropdownButtonFormField(
                value: bookCondition,
                decoration: inputDecoration(),
                items: ['New', 'Good', 'Fair', 'Poor']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    bookCondition = value!;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select condition' : null,
              ),

              const SizedBox(height: 12),

              // Upload Cover
              const Text("Book Cover Image"),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _pickedImage == null
                    ? Center(
                        child: ElevatedButton.icon(
                          onPressed: _pickImage,
                          icon: const Icon(Icons.upload, color: Colors.white),
                          label: const Text(
                            'Upload Cover',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFDB4437),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          _pickedImage!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
              ),

              const SizedBox(height: 12),

              // Number of Books
              const Text("Number Of Books"),
              DropdownButtonFormField(
                value: numBooks,
                decoration: inputDecoration(),
                items: List.generate(
                        10,
                        (index) => DropdownMenuItem(
                            value: '${index + 1}',
                            child: Text('${index + 1}')))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    numBooks = value!;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select number of books' : null,
              ),

              const SizedBox(height: 24),

              const Text("👤 Donor Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              const SizedBox(height: 16),

              // Donor Name
              const Text("Name Of the Donor"),
              TextFormField(
                controller: _donorNameController,
                decoration: inputDecoration(),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter donor name' : null,
              ),

              const SizedBox(height: 12),

              // Phone
              const Text("Phone Number"),
              TextFormField(
                controller: _phoneController,
                decoration: inputDecoration(),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter phone number' : null,
              ),

              const SizedBox(height: 12),

              // Email
              const Text("Email"),
              TextFormField(
                controller: _emailController,
                decoration: inputDecoration(),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter email' : null,
              ),

              const SizedBox(height: 12),

              // Location
              const Text("Location"),
              TextFormField(
                controller: _locationController,
                decoration: inputDecoration(),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter location' : null,
              ),

              const SizedBox(height: 12),

              // Donation Mode
              const Text("Mode Of Donation"),
              DropdownButtonFormField(
                value: donationMode,
                decoration: inputDecoration(),
                items: ['In-person', 'Courier', 'Other']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    donationMode = value!;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select donation mode' : null,
              ),

              const SizedBox(height: 12),

              // Recipient Category
              const Text("Category Of Recipient"),
              DropdownButtonFormField(
                value: recipientCategory,
                decoration: inputDecoration(),
                items: ['Student', 'Library', 'Charity']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    recipientCategory = value!;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select recipient category' : null,
              ),

              const SizedBox(height: 24),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Donation Submitted!')));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 40),
                    backgroundColor: const Color(0xFFDB4437),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Donate',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

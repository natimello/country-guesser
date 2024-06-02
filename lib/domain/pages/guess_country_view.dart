import 'package:country_guesser/domain/controllers/country_controller.dart';
import 'package:country_guesser/domain/controllers/country_state.dart';
import 'package:country_guesser/domain/pages/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuessCountryView extends StatefulWidget {
  final CountryController controller;

  const GuessCountryView({super.key, required this.controller});

  @override
  State<GuessCountryView> createState() => _GuessCountryViewState();
}

class _GuessCountryViewState extends State<GuessCountryView> {
  final formKey = GlobalKey<FormState>();
  final answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    await widget.controller.getAllCountries();
    widget.controller.getRandomCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: const CustomAppBar(
        title: 'CountryGuesser',
        icon: 'assets/icons/countries.png',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Guess the country',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                )),
            const SizedBox(height: 30),
            BlocBuilder<CountryController, CountryState>(
              bloc: widget.controller,
              buildWhen: (previous, current) =>
                  previous.country != current.country,
              builder: (context, state) {
                if (widget.controller.state.status == CountryStatus.success) {
                  return Image.network(
                      widget.controller.state.country!.flags!.png!);
                } else if (widget.controller.state.status ==
                    CountryStatus.failure) {
                  return const Text('Deu pau');
                } else {
                  return Container();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: TextField(
                key: formKey,
                textAlign: TextAlign.center,
                controller: answerController,
                keyboardType: TextInputType.text,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  widget.controller.checkAnswer(answerController!.text);
                }
              },
              child: const Text('Check'),
            ),
          ],
        ),
      ),
    );
  }
}
